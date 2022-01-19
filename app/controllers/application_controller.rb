class ApplicationController < ActionController::Base
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :configure_account_update_parameters, if: :devise_controller?

 protected
 
  def configure_permitted_parameters
    add_attrs = [:name, :email, :password, :profile, :icon_image]
    devise_parameter_sanitizer.permit(:sign_up, keys: add_attrs)
    devise_parameter_sanitizer.permit(:account_update, keys: [:name,:email,:password, :profile, :icon_image])
  end
  
  def configure_account_update_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email,:password, :profile, :icon_image])
  end
end
