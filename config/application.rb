require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Pinebox
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Set the applications timezone
    config.time_zone = 'UTC'
    config.active_record.default_timezone = :local
    config.active_job.queue_adapter = :sidekiq
    config.cache_storage = :redis_cache_store, { driver: :hiredis, url: ENV.fetch('REDIS_URL'){ 'redis://localhost:6379/0' } }

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    # Allow belongs_to to optional
    config.active_record.belongs_to_required_by_default = false
  end
end
