class ApplicationController < ActionController::Base
    before_action :update_allowed_parameters, if: :devise_controller?
    protect_from_forgery with: :null_session,
                         if: proc { |c| c.request.format =~ %r{application/json} }

    def after_sign_in_path_for(_resource)
      params[:target] || user_groups_path(current_user.id)
    end
  
    protected
  
    def update_allowed_parameters
      devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :surname, :email, :password, :password_confirmation) }
      devise_parameter_sanitizer.permit(:account_update) do |u|
        u.permit(:name, :surname, :email, :password, :current_password)
      end
    end
end
