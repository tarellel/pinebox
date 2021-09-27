# frozen_string_literal: true

# Modified from => https://github.com/rails/rails/blob/feb97dfabd027a73a41ca8bd2ab7c3196ab76d3d/railties/lib/rails/tasks/statistics.rake
# While global constants are bad, many 3rd party tools depend on this one (e.g
# rspec-rails & cucumber-rails). So a deprecation warning is needed if we want
# to remove it.
STATS_FOLDERS = [
  %w[App/libs           app/lib],
  %w[Channels           app/channels],
  %w[Components         app/components],
  %w[Controllers        app/controllers],
  %w[Decorators         app/decorators],
  %w[Helpers            app/helpers],
  %w[JavaScript         app/javascript],
  %w[JavaScripts        app/assets/javascripts],
  %w[Jobs               app/jobs],
  %w[Libraries          lib/],
  %w[Mailboxes          app/mailboxes],
  %w[Mailers            app/mailers],
  %w[Models             app/models],
  %w[Policies           app/policies],
  %w[Services           app/services],
  %w[Queries            app/queries],
  %w[Validators         app/validators],
  %w[Workers            app/workers],

  # Stats for tests/rspec
  %w[Channel\ tests     spec/channels],
  %w[Component\ Tests   spec/components],
  %w[Controller\ tests  spec/controllers],
  %w[Decorator\ tests   spec/decorators],
  %w[Helper\ tests      spec/helpers],
  %w[Integration\ tests spec/integration],
  %w[Job\ tests         spec/jobs],
  %w[Model\ tests       spec/models],
  %w[Mailer\ tests      spec/mailers],
  %w[Mailbox\ tests     spec/mailboxes],
  %w[Policy\ tests      spec/policies],
  %w[System\ tests      spec/system],
  %w[Worker\ tests      spec/workers]
].sort_by { |key, _v| key.downcase }
                .collect { |name, dir| [name, "#{File.dirname(Rake.application.rakefile_location)}/#{dir}"] }
                .select { |_name, dir| File.directory?(dir) }

desc 'Report code statistics (KLOCs, etc) from the application or engine'
task more_stats: :environment do
  require 'rails/code_statistics'
  CodeStatistics.new(*STATS_FOLDERS).to_s
end
