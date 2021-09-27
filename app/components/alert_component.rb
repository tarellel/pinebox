# frozen_string_literal: true

class AlertComponent < ViewComponent::Base
  def initialize(type:, msg:)
    @type = type
    @msg = msg
  end

  # Return the background and border classes for the specific alert type
  #
  # @return [String]
  def color_classes
    case @type.to_sym
    when :success
      'bg-green-50 border-green-400'
    when :error
      'bg-yellow-50 border-yellow-400'
    when :alert
      'bg-red-50 border-red-400'
    else # notice
      'bg-indigo-50 border-indigo-400'
    end
  end

  # Return the class for the alert type
  #
  # @return [String]
  def text_classes
    case @type.to_sym
    when :success
      'text-green-500'
    when :error
      'text-yellow-500'
    when :alert
      'text-red-500'
    else # notice
      'text-indigo-500'
    end
  end
end
