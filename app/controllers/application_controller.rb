class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def after_sign_in_path_for(resource)
    if resource_name == :seeker
      seekerdashboard_path
    elsif resource_name == :employer 
      employerdashboard_path
    elsif resource_name == :admin
      admindashboard_path
    end
  end
  
  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :rep_fname, :rep_lname, :company_name])
  end
end
