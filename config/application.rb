require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module WritingWebApp
  class Application < Rails::Application
    config.load_defaults 6.0
    
    config.active_record.schema_format = :sql

    config.web_console.permissions = '172.16.0.0/12'
  end
end
