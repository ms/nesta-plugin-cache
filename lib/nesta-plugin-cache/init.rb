module Nesta
  module Plugin
    module Cache
      module Helpers
        def page_cache_key(page, key, converter)
          page.metadata(key).nil? ? nil : page.metadata(key).send(converter)
        end
      end
    end
  end

  class App
    helpers Nesta::Plugin::Cache::Helpers
  
    expires_time = Nesta::Config.fetch('expires', nil)
    expires_type = Nesta::Config.fetch('expires_type', 'public').to_sym

    # The default expires values
    before do
      unless expires_time.nil?
        expires(expires_time, expires_type, :must_revalidate)
      end
    end

    after do
      # Check that this is a regular page (ie not the sitemap, atom feed, an
      # attachement or a CSS stylesheet): these don't have metadata; and check
      # that the page defined a per-page expires directive.
      unless @page.nil?
        page_expires_time = page_cache_key(@page, 'expires', :to_i)
        page_expires_type = page_cache_key(@page, 'expires type', :to_sym)
        unless page_expires_time.nil?
          type = page_expires_type || expires_type
          expires(page_expires_time, type, :must_revalidate)
        end
      end
    end
  end
end
