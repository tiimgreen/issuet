class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    # rubocop:disable Blocks, BlockAlignment, LineLength
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(
      :username, :email, :name, :password, :password_confirmation, :remember_me) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(
      :login, :username, :email, :password, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(
      :username, :email, :name, :password, :password_confirmation, :current_password) }
    # rubocop:enable Blocks, BlockAlignment, LineLength
  end
end
