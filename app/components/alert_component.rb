# frozen_string_literal: true

# https://gist.github.com/ParamagicDev/5dc17dea9e8ab414d227461ae521f011
# https://dry-rb.org/gems/dry-initializer/3.0/
class AlertComponent < ViewComponent::Base
  extend Dry::Initializer

  ALERTS = {
    alert: {
      icon: :exclamation_icon,
      text: 'text-red-500',
      bg: 'bg-red-50 border-red-400'
    }.freeze,
    error: {
      icon: :exclamation_circle_icon,
      text: 'text-yellow-500',
      bg: 'bg-yellow-50 border-yellow-400'
    }.freeze,
    notice: {
      icon: :information_circle_icon,
      text: 'text-indigo-500',
      bg: 'bg-indigo-50 border-indigo-400'
    }.freeze,
    success: {
      icon: :check_circle_icon,
      text: 'text-green-500',
      bg: 'bg-green-50 border-green-400'
    }.freeze
  }.freeze

  option :type, proc(&:to_sym), default: proc { :notice }
  option :message, proc(&:to_s)
  # Return the class for the alert text color classes
  option :text_class, default: proc { |val| (val || ALERTS[type][:text]).to_s }
  # Return the background and border classes for the specific alert type
  option :bg_class, default: proc { |val| (val || ALERTS[type][:bg]).to_s }
  option :icon, default: proc { |val| (val || ALERTS[type][:icon]).to_s }
end
