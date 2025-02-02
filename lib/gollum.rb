# ~*~ encoding: utf-8 ~*~
# stdlib
require 'digest/md5'
require 'digest/sha1'
require 'ostruct'

# external
require 'i18n'
require 'github/markup'
require 'rhino' if RUBY_PLATFORM == 'java'

# internal
require ::File.expand_path('../gollum/uri_encode_component', __FILE__)

module Gollum
  VERSION = '6.0.6'

  ::I18n.available_locales = [:en]
  ::I18n.load_path = Dir[::File.expand_path("lib/gollum/locales") + "/*.yml"]

  def self.assets_path
    ::File.expand_path('gollum/public', ::File.dirname(__FILE__))
  end

  class TemplateFilter
    @@filters = {}

    def self.add_filter(pattern, &replacement)
      @@filters[pattern] = replacement
    end

    def self.apply_filters(data)
      @@filters.each do |pattern, replacement|
        data.gsub!(pattern, replacement.call)
      end
      data
    end
  end
end
