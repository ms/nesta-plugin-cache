# Nesta::Plugin::Cache

This plugin provides caching directives on each page that lets Nesta return
appropriate caching headers to the client and any proxy between the server and
the client. This improves performance.

## Installation

Add this line to your application's Gemfile:

    gem 'nesta-plugin-cache'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install nesta-plugin-cache

## Usage

### Global settings

Set the entries `expires` and `expires\_type` to the appropriate values in your
`config.yml`.

	expires
	    The amount of time each page can be cached for by the client. If your
	    pages changes very often, set this to a small value. If on the other hand
	    your pages are mostly static, set it to a large value. Within the time you
	    put, a browser that has a copy of the file in its cache might choose not
	    to requery your website for the latest version. Can be overriden in
	    individual pages. In seconds.
	    Default: 0

	expires: 3600

	expires\_type
	    Whether or not proxies can cache the pages we serve. If set to public,
	    both proxies between the browser and the web server and the browser itself
	    can cache the pages. If set to private, only the client's browser can.
	    In practice, if the pages are modified depending on who requests
	    them, you should set this to private. Otherwise if all clients get the
	    same page (usually the case, particularly on nesta websites), set it to
	    public.
	    Default: public

	expires\_type: private

### Per-page settings

If you want to change the global settings on a page by page basis (for a page
that is updated very often for example), you can set the appropriate meta data
fields: `Expires` and `Expires Type`.

For more info on the expires types, see the following RFC:

* http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.9.1

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
