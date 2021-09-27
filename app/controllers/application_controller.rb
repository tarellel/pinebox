# frozen_string_literal: true

class ApplicationController < ActionController::Base
  add_flash_types :success, :error # Enable additional flash types across the application
  protect_from_forgery with: :exception

  include Authentication, Authorization, ErrorHandlers
  helper :all

  private

  # def set_layout!
  #   if devise_controller?
  #     :devise
  #   else
  #     :application
  #   end
  # end
end
