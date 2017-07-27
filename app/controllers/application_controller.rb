class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  
  before_action :configure_permitted_parameters, if: :devise_controller?
  

  #   def login=(login)
  #   @login = login
  # end

  # def login
  #   @login || self.username || self.email
  # end

  protected

  def configure_permitted_parameters
    added_attrs = [:first_name, :last_name, :user_name, :phone_number, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    sign_in_attrs = [:login,:password]
    devise_parameter_sanitizer.permit :sign_in, keys: sign_in_attrs

    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end
