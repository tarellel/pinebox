# frozen_string_literal: true

module Authentication
  extend ActiveSupport::Concern

  included do
    before_action :configure_permitted_parameters, if: :devise_controller?
  end

  private

  # If you want to add custom attributes to the devise to be editable (ie: username)
  def configure_permitted_parameters
    # devise_parameter_sanitizer.permit(:sign_up, keys: %i[email password password_confirmation name])
    # devise_parameter_sanitizer.permit(:account_update, keys: %i[email password password_confirmation current_password name])
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name])
  end
end
