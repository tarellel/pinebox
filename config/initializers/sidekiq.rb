# frozen_string_literal: true

require 'sidekiq'
# https://github.com/mperham/sidekiq/issues/3535
# https://github.com/mperham/sidekiq/wiki/Using-Redis

if defined?(Sidekiq)
  Sidekiq.configure_server do |config|
    # use hiredis for C based redis client connection
    config.redis = { driver: :hiredis,
                     url: ENV.fetch('REDIS_URL'){ 'redis://localhost:6379/0' },
                     namespace: 'workers' }
  end

  Sidekiq.configure_client do |config|
    config.redis = { driver: :hiredis,
                     url: ENV.fetch('REDIS_URL'){ 'redis://localhost:6379/0' },
                     namespace: 'workers' }
  end
end
