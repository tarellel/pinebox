# frozen_string_literal: true

if defined?(Lookbook)
  Rails.application.config.view_component.default_preview_layout = 'component_preview'

  # https://github.com/allmarkedup/lookbook#opting-into-all-experimental-features-not-recommended
  # https://github.com/allmarkedup/lookbook#--param-experimental
  Rails.application.config.lookbook.experimental_features = true
end
