# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gem 'rails', '~> 6.1'
gem 'puma', '~> 5.0'            # Use Puma as the app server
# gem 'image_processing', '~> 1.2'  # Use Active Storage variant

##############################
### Database
##############################
gem 'pg', '~> 1.2'      # Use postgresql as the database for Active Record
# gem 'rails-erd', group: :development            # Generate an application ERD
gem 'strong_migrations'

##############################
### Assets, Decorators, and Views
##############################
gem 'active_decorator'
gem 'rails_heroicons'
gem 'sass'
gem 'slim-rails'
gem 'turbo-rails'
gem 'view_component', require: 'view_component/engine' # https://viewcomponent.org/
gem 'vite_rails'

##############################
# Authorization, Authentication [Roles], and permissions
##############################
gem 'argon2', '>= 2'            # https://ankane.org/devise-argon2
gem 'devise'                    # Rails based user authentication
gem 'devise-security'           # Additional security measures for devise
gem 'pretender'                 # allows superusers to emulate being another user
gem 'pundit'                    # A slim user authorization library
gem 'rolify'                    # For managing user roles
gem 'valid_email2'              # Stronger email validator (Includes RFC, blackist, and whitelist validations)

##############################
# Background jobs and Redis
##############################
gem 'hiredis'                   # C based adapter for connecting to redis
gem 'redis', '~> 4.0'
gem 'sidekiq', '>= 6.0'         # For scheduling background jobs
gem 'sidekiq-failures'          # Shows you a list of failed sidekiq jobs
gem 'sidekiq-scheduler'         # Lightweight job scheduler (mimicks cron scheduling)
gem 'sidekiq-status'            # View the status of any currently running sidekiq jobs

##############################
# Misc
##############################
gem 'auto_strip_attributes'     # Reduce needing to add before_validation hooks to the models to cleanup attributes
gem 'friendly_id'
gem 'jbuilder'                  # Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'meta-tags'                 # Used for adding dynamic titles when switching between pages.
gem 'name_of_person'
gem 'oj'                        # For faster json generating and parsing
gem 'simple_form'               # A DSL to make forms easier to work with
gem 'pagy', '~> 4.11'           # An extremely fast pagination alternative
gem 'ransack'                   # For making sorting and searching of models easy

##############################
### Performance Optimizations
##############################
gem 'attendance'                # Speed up for ActiveRecord#present? (removes additional query requests)
gem 'bootsnap', '>= 1.4.4', require: false   # Reduces boot times through caching
gem 'fast_blank', platform: :mri             # fast implementation of .blank?

##############################
### Security (Data Security)
##############################
gem 'lograge'                   # For cleaning up your application logs
gem 'logstop'                   # Keep personally identifiable information (PII) out of your logs

##############################
### Development/Testing gems
##############################
group :development, :test do
  gem 'brakeman'                # Security Auditing Linter
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails'       # For building fixtures/objects associated with your models
  gem 'faker'                   # For generating fake data for tests
  gem 'fasterer', require: false
  gem 'rails_best_practices'    # for testing for rails best practice methods
  gem 'rubocop', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false
  gem 'sord'                    # For building Sorbet RBI type checking based off of inline YARD docs

  gem 'foreman'                 # Process manager used to fire up all the required services for the application

  # --- Console cleanup and coloring
  gem 'pry', '~> 0.13'
  gem 'pry-byebug', '~> 3.9'
  gem 'pry-rails'               # pry console output
  gem 'spirit_hands', github: 'dwarburt/spirit_hands' # A combination of pry, awesome_print, hirb, and numerous other console extensions

  # --- Linters / Asset testing
  gem 'erb_lint', require: false
  gem 'scss_lint', require: false
  gem 'slim_lint', require: false

  # --- Profilers
  gem 'rack-mini-profiler'
  gem 'memory_profiler'
  gem 'stackprof'
end

group :development do
  gem 'annotate'
  gem 'better_errors'             # dev: better error messages
  gem 'binding_of_caller'
  gem 'bullet'
  gem 'listen', ">= 3.0.5"
  gem 'spring'
  gem 'spring-watcher-listen'
  gem 'web-console'               # Gives a console interface for bugs during development

  gem 'guard', '~> 2.16', '>= 2.16.2'
  gem 'guard-bundler', require: false
  gem 'guard-shell', require: false

  # Generate tailwind templates
  gem 'simple_form-tailwind'
  gem 'tailwind_views_generator'
end

group :test do
  # gem 'active_decorator-rspec'  # To make testing decorators easy with rspec
  gem 'database_cleaner'          # n+1 database test monitoring
  gem 'cucumber-rails', require: false
  gem 'fuubar'
  gem 'parallel_tests'            # Used to run your tests in parellel
  gem 'pundit-matchers', '~> 1.7'
  gem 'rspec-rails', '>= 3.8'
  gem 'rspec-sidekiq'
  gem 'rails-controller-testing'  # , github: 'rails/rails-controller-testing'
  gem 'simplecov', require: false             # generate html report on the applications test results
  gem 'simplecov-tailwindcss', require: false # Cleanup simplecov HTML report with a tailwind template
  gem 'shoulda', '>= 4.0'         # Write easy to understand and maintainable tests
  gem 'test-prof', '~> 1.0'       # Performance profiling for tests
  gem 'timecop'                   # Running tests against time

  ##############################
  ### integration testing
  ##############################
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 3.26'
  gem 'selenium-webdriver'
  gem 'webdrivers', '>= 3.0'
end


# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
