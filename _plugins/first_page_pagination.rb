# Custom pagination: the first page ("/") shows fewer posts than later pages.
#
#   site.paginate_first_page — number of posts on page 1
#   site.paginate_per_page   — number of posts on pages 2..N ("/2/", "/3/", ...)
#
# Only runs when `paginate_first_page` is set in the config. Configs that use
# stock jekyll-paginate (e.g. _config_geoviz.yml) are left untouched.
#
# Produces the same `paginator` payload fields that _layouts/home.html already
# consumes: posts, page, total_pages, next_page, previous_page,
# next_page_path, previous_page_path. Posts are paginated newest-first to
# match the previous jekyll-paginate behavior.
#
# Jekyll's renderer exposes `paginator` in Liquid only when the page object
# responds to `pager` (see Jekyll::Renderer#payload), so every paginated page
# — including page 1 — is a GeneratedPage.
class FirstPagePagination < Jekyll::Generator
  priority :low

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
    return unless site.config['paginate_first_page']

    first_count = site.config['paginate_first_page'].to_i
    per_page = site.config['paginate_per_page'] || DEFAULT_PER_PAGE

    index = site.pages.find { |page| page.url == '/' }
    return if index.nil?

    # site.posts.docs is oldest-first; serve newest-first like jekyll-paginate.
    posts = site.posts.docs.reverse

    # Fewer posts than the first-page count: leave the index alone.
    return if posts.size <= first_count

    chunks = [posts.take(first_count)]
    posts.drop(first_count).each_slice(per_page) { |slice| chunks << slice }

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