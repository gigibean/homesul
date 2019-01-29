class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  #before_action :authenticate_user!

  # def authentication_required
  #   redirect_to new_user_session_path if !logged_in?
  # end
  # def current_user
  #   return unless session[:user_id]
  #   @current_user ||= User.find(session[:user_id])
  # end
  # def logged_in? 
  #   current_user.present?
  # end

  # def current_user
  #   @current_user ||= User.find(session[:user_id]) if session[:user_id] 
  # end
  #helper_method :current_user
  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, address_attributes: [:country, :city, :area]])
  end
end
