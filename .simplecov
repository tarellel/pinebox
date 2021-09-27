# frozen_string_literal: true

require 'simplecov'
require 'simplecov-tailwindcss'

SimpleCov.start('rails') do
  add_group 'Policies', 'app/policies'

  add_filter('/bin/')
  add_filter('/config/')
  add_filter('/db/')
  add_filter('/docs/')
  add_filter('/lib/tasks/auto_annotate_models.rake')
  add_filter('/lib/tasks/coverage.rake')
  add_filter('/node_modules/')
  add_filter('/public/')
  add_filter('/storage/')
  add_filter('/tmp/')
end
SimpleCov.minimum_coverage(75)
SimpleCov.use_merging(false)
SimpleCov.formatters = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::HTMLFormatter,
  SimpleCov::Formatter::TailwindFormatter
])
