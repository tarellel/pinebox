# frozen_string_literal: true

Rails.application.config.generators do |g|
  g.assets false
  g.javascripts false
  g.stylesheets false
  g.jbuilder false
  g.helper false
  g.form_framework :simple_form
  g.template_engine :slim
  # g.orm :active_record, primary_key_type: :uuid

  g.fixture_replacement :factory_bot, dir: 'spec/factories'
  g.integration_tool :rspec
  g.test_framework :rspec, fixture: false
end
