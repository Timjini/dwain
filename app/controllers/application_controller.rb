class ApplicationController < ActionController::Base
    before_action :set_theme

    # skip CSRF token validation for JSON, JavaScript and XML requests
    protect_from_forgery with: :null_session



  def set_theme
    if params[:theme].present?
      theme = params[:theme].to_sym
      # session[:theme] = theme
      cookies[:theme] = theme
      redirect_to(request.referer || root_path)
    end
  end
end
