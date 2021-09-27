# frozen_string_literal: true

# Used for creating links for dropdown menus
class Dropdown::LinkComponent < ViewComponent::Base
  attr_accessor :icon, :url, :args

  def initialize(icon: nil, text: '', url: '#', **kwargs)
    @icon = icon
    @url = url
    @label = (text.presence || url)
    @args = kwargs
  end

  # Determine if the dropdown has additional args to assign to it
  #
  # @return [Hash]
  def before_render
    @args = {} if @args.blank? || !args.is_a?(Hash)
  end

  # Create a label for the the icons link
  #
  # @return [String]
  def label
    "#{@icon}#{@label}"
  end
end
