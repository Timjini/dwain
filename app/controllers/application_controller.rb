class ApplicationController < ActionController::Base
    before_action :set_theme
    #before_action :set_active_storage_url_options

    # skip CSRF token validation for JSON, JavaScript and XML requests
    protect_from_forgery with: :null_session

    # santitize devise parameters
    before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    if resource_name == :user
      devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :password_confirmation, :dob, :phone, :username, :first_name, :last_name, :address, :city, :height, :weight, :avatar])
      devise_parameter_sanitizer.permit(:account_update, keys: [:email, :password, :password_confirmation, :current_password, :dob, :phone, :username, :first_name, :last_name, :address, :city, :height, :weight,:avatar])
    elsif resource_name == :coach
      devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :password_confirmation, :dob, :phone, :username, :first_name, :last_name, :address, :city, :height, :weight, :coach_type, :avatar])
      devise_parameter_sanitizer.permit(:account_update, keys: [:email, :password, :password_confirmation, :current_password, :dob, :phone, :username, :first_name, :last_name, :address, :city, :height, :weight, :coach_type ,:avatar])
    end
  end

  # def set_active_storage_url_options
  #   ActiveStorage::Current.url_options = Rails.application.config.action_controller.default_url_options
  # end


  def set_theme
    if params[:theme].present?
      theme = params[:theme].to_sym
      # session[:theme] = theme
      cookies[:theme] = theme
      redirect_to(request.referer || root_path)
    end
  end
end
