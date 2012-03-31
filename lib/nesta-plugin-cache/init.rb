module Nesta
  module Plugin
    module Cache
      module Helpers
        # If your plugin needs any helper methods, add them here...
      end
    end
  end

  class Config
    @settings += %w[expires expires_type]
  end

  class Page
    def expires
      metadata('expires').nil? ? nil : metadata('expires').to_i
    end

    def expires_type
      metadata('expires type').nil? ? nil : metadata('expires type').to_sym
    end
  end

  class App
    helpers Nesta::Plugin::Cache::Helpers
  
    # Add the Nesta config entries to the Sinatra settings object
    set :expires_time, Config.expires
    set :expires_type, (Config.expires_type.nil? ?
                        nil : Config.expires_type.to_sym)

    # The default expires values
    before do
      unless settings.expires_time.nil?
        expires settings.expires_time,
          settings.expires_type || :public,
          :must_revalidate
      end
    end

    after do
      # Check that this is a regular page (ie not the sitemap, atom feed, an
      # attachement or a CSS stylesheet): these don't have metadata; and check
      # that the page defined a per-page expires directive.
      unless @page.nil? || @page.expires.nil?
        expires @page.expires,
          @page.expires_type || settings.expires_type || :public,
          :must_revalidate
      end
    end
  end
end
