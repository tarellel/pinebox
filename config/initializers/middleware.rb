# frozen_string_literal: true

Rails.application.config.middleware do |config|
  # enable gzip asset compressing to reduce the page size
  config.use Rack::Deflater
end
