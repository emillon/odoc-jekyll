module OdocPlugin
  class OdocPageGenerator < Jekyll::Generator
    safe true

    def find_all_pages(hash)
      results = {}
      def iter(hash, path, results)
        hash.each do |key, value|
          if key == 'indexhtml' then
            results[path] = value
          elsif value.is_a? Hash
            iter(value, path+[key], results)
          else
            raise "Don't know what to do with value #{value}\n"
          end
        end
      end
      iter(hash, [], results)
      results
    end

    def generate(site)
      pages = find_all_pages(site.data['_html'])
      pages.each do |path, data|
        site.pages << OdocPage.new(site, path, data)
      end
    end
  end

  class OdocPage < Jekyll::Page
    def initialize(site, path, data)
      @site = site
      @base = site.source
      @dir = path.join('/')
      @basename = 'index'
      @ext = '.html'
      @name = @basename + @ext
      @data = {'odoc' => data, 'layout' => 'odoc'}
    end
  end
end
