module Jekyll
  # jekyll-postfiles can register identical StaticFile entries multiple times
  # when many posts share a directory. Keep one entry per destination path.
  class DedupeStaticFilesGenerator < Generator
    priority :lowest

    def generate(site)
      seen = {}
      site.static_files = site.static_files.select do |file|
        destination = file.destination(site.dest)
        next false if seen[destination]

        seen[destination] = true
        true
      end
    end
  end
end
