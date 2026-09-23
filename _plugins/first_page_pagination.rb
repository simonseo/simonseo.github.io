# Custom pagination: the first page ("/") shows fewer posts than later pages.
#
#   site.paginate_first_page — number of posts on page 1
#   site.paginate_per_page   — number of posts on pages 2..N ("/2/", "/3/", ...)
#
# Replaces jekyll-paginate for the homepage (jekyll-paginate is dormant when
# `paginate` is unset in the config). Produces the same `paginator` payload
# fields that _layouts/home.html already consumes: posts, page, total_pages,
# next_page, previous_page, next_page_path, previous_page_path.
#
# Jekyll's renderer exposes `paginator` in Liquid only when the page object
# responds to `pager` (see Jekyll::Renderer#payload), so every paginated page
# — including page 1 — is a GeneratedPage.
class FirstPagePagination < Jekyll::Generator
  priority :low

  DEFAULT_FIRST_PAGE = 4
  DEFAULT_PER_PAGE = 8

  # Pages are generated in memory, so nothing is read from disk —
  # unlike Jekyll::Page, whose initialize expects a source file.
  class GeneratedPage < Jekyll::Page
    attr_reader :pager

    def read_yaml(*)
      self.data = {}
      self.content = ""
    end

    def pager=(pager)
      @pager = pager
      data['paginator'] = pager
    end
  end

  def generate(site)
    first_count = site.config['paginate_first_page'] || DEFAULT_FIRST_PAGE
    per_page = site.config['paginate_per_page'] || DEFAULT_PER_PAGE

    posts = site.posts.docs
    return if posts.empty? || first_count >= posts.size

    chunks = [posts.take(first_count)]
    posts.drop(first_count).each_slice(per_page) { |slice| chunks << slice }

    index = site.pages.find { |page| page.url == '/' }
    return if index.nil?

    (1..chunks.size).each do |num|
      page = GeneratedPage.new(site, site.source, num == 1 ? '/' : "#{num}/", 'index.html')
      page.data = index.data.reject { |key, _| key == 'paginator' }
      page.content = index.content.to_s
      page.pager = pager_for(num, chunks)
      site.pages << page
    end
    site.pages.delete(index)
  end

  private

  def pager_for(num, chunks)
    total = chunks.size
    {
      'page' => num,
      'posts' => chunks[num - 1],
      'total_pages' => total,
      'next_page' => num < total ? num + 1 : nil,
      'previous_page' => num > 1 ? num - 1 : nil,
      'next_page_path' => num < total ? "/#{num + 1}/" : nil,
      'previous_page_path' => num > 1 ? (num == 2 ? '/' : "/#{num - 1}/") : nil,
    }
  end
end