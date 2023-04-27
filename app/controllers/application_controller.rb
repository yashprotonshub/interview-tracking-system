class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :authenticate_user!

    before_action :configure_permitted_parameters, if: :devise_controller?


    def after_sign_in_path_for(resource)
        if resource.applicant_type == "Interviewer"
            new_user_interviewer_profile_path(resource)
        else
            root_path
        end
    end

    def after_sign_out_path_for(resource)
        new_user_session_path(resource)
    end
    protected

        def configure_permitted_parameters
            devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:applicant_type,:name, :email, :password)}

            devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:applicant_type, :name, :email, :password, :current_password)}
        end
    
end
