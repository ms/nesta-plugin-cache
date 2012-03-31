# -*- encoding: utf-8 -*-
require File.expand_path('../lib/nesta-plugin-cache/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Max Sadrieh"]
  gem.email         = ["max.sadrieh@gmail.com"]
  gem.description   = %q{Cache-control headers plugin for Nesta, a Ruby CMS}
  gem.summary       = <<-EOF
This Nesta plugin lets you define cache control headers globally for your site
or on a page by page basis. This can improve performance tremendously since the
client browsers can use cached versions of your pages for a set amount of time.

The global values are set in the config.yml by using expires and expires_type
and the per-page values are defined in each page's metadata by using the
Expires and Expires Type fields.
  EOF
  gem.homepage      = "http://www.sadrieh.me/projects/nesta-plugin-cache"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "nesta-plugin-cache"
  gem.require_paths = ["lib"]
  gem.version       = Nesta::Plugin::Cache::VERSION
  gem.add_dependency("nesta", "~> 0.9.11")
  gem.add_dependency("sinatra", "~> 1.2")
  gem.add_development_dependency("rake")
end
