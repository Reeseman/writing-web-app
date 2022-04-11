# typed: strict
require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module WritingWebApp
  class Application < Rails::Application
    config.load_defaults 6.0

    config.active_record.schema_format = :sql
    config.active_record.dump_schema_after_migration = false

    # config.web_console.permissions = '192.168.0.0/16'

    #     if ENV['DOCKERIZED'] == 'true'
    #       config.web_console.whitelisted_ips = ENV['DOCKER_HOST_IP']
    #     end
  end
end
