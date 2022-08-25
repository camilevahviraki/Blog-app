class ApplicationController < ActionController::Base
    respond_to :html, :json
    protect_from_forgery with: :exception

    before_action :update_allowed_parameters, if: :devise_controller?
  
    protected
  
    def update_allowed_parameters
      devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:Name, :Photo, :email, :password, :Bio, :password_confirmation)}
      devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:Name, :Bio, :Photo, :email, :password, :current_password)}
    end
end
