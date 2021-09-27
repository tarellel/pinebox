# frozen_string_literal: true

if defined?(PigCI)
  require 'pig_ci'
  PigCI.start do |config|
    # Maximum memory in megabytes
    config.thresholds.memory = 350

    # Maximum time per a HTTP request
    config.thresholds.request_time = 250

    # Maximum database calls per a request
    config.thresholds.database_request = 35
  end if RSpec.configuration.files_to_run.count > 1
end
