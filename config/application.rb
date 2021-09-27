require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Pinebox
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # Set the applications timezone
    config.time_zone = 'UTC'
    config.active_record.default_timezone = :local
    config.active_job.queue_adapter = :sidekiq
    config.cache_storage = :redis_cache_store, { driver: :hiredis, url: ENV.fetch('REDIS_URL'){ 'redis://localhost:6379/0' } }

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # Allow belongs_to to optional
    config.active_record.belongs_to_required_by_default = false
  end
end
