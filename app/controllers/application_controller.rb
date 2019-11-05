class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:sign_up, keys: [:fullname, :phone_number, :description, :avatar])
  devise_parameter_sanitizer.permit(:account_update, keys: [:fullname, :avatar, :phone_number, :description])


  end
end
