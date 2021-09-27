# frozen_string_literal: true

module ApplicationHelper
  include Pagy::Frontend

  def flash_messages(_opts = [])
    return '' unless flash.any?

    # remove any blank devise timeout errors
    flash.delete(:timedout)
    flash.each do |msg_type, message|
      # You don't need to create an empty alert message
      next if message.blank? || message.to_s.length.zero?

      concat render(AlertComponent.new(type: msg_type, msg: message))
    end
    nil
  end

  # for outputting an objects error messages
  def errors_for(object)
    return '' unless object.errors.any?

    content_tag(:div, class: 'text-sm bg-red-50 rounded p-5 mb-5') do
      concat(content_tag(:div, class: 'text-red-600 font-medium') do
        concat "#{pluralize(object.errors.count, 'error')} prohibited this #{object.class.name.downcase} from being saved:"
      end)
      concat(content_tag(:ul, class: 'px-0 text-red-500 italic font-sm') do
        object.errors.full_messages.each do |msg|
          concat content_tag(:li, msg, class: 'list-disc px-0 py-1 mx-4')
        end
      end)
    end
  end
end
