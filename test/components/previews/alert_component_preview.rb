# frozen_string_literal: true

class AlertComponentPreview < ViewComponent::Preview
  # Default Alert
  # ---------------
  # This is the alert style that gets generated if no `type` has been specified
  #
  # @label Default
  # @hidden
  def default
    # http://localhost:3000/rails/view_components/alert_component/default
    # ApplicationController.helpers.render(AlertComponent.new(type: :success, message: 'foobar'))
    render(AlertComponent.new(message: 'foobar'))
  end

  # Switchable Alert (PoC example)
  # ---------------
  # This is the alert style that gets generated if no `type` has been specified
  #
  # @label Switchable
  # @param type select [alert, error, notice, success]
  def switchable(type: 'alert', message: 'something happened')
    render(AlertComponent.new(type: type, message: message))
  end

  # @!group Alerts

  # Error Alert
  # ---------------
  # This is the alert that generates an error message
  # and allows a dynamic preview parameter for the error message
  #
  # @label Alert
  # @param message text
  def alert(message: 'something happened')
    render(AlertComponent.new(type: :alert, message: message))
  end

  # Error Alert
  # ---------------
  # This is the alert that generates an error message
  # and allows a dynamic preview parameter for the error message
  #
  # @label Error
  # @param message text
  def error(message: 'something happened')
    render(AlertComponent.new(type: :error, message: message))
  end

  # Notice Alert
  # ---------------
  # This is the alert that generates an notice message
  # and allows a dynamic preview parameter for the notice message
  #
  # @label Notice
  # @param message text
  def notice(message: 'something happened')
    render(AlertComponent.new(type: :notice, message: message))
  end

  # Success Alert
  # ---------------
  # This is the alert that generates an success message
  # and allows a dynamic preview parameter for the success message
  #
  # @label Success
  # @param message text
  def success(message: 'something happened')
    render(AlertComponent.new(type: :success, message: message))
  end

  # @!endgroup
end
