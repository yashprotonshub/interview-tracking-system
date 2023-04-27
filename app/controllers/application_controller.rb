class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :authenticate_user!

    before_action :configure_permitted_parameters, if: :devise_controller?


    def after_sign_in_path_for(resource)
        if resource.applicant_type == "Interviewer"  
            if current_user.interviewer_profile.present?
                root_path
            else
                new_user_interviewer_profile_path(resource)         
            end
        else
            root_path
        end
    end

    protected

        def configure_permitted_parameters
            devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:applicant_type,:name, :email, :password)}

            devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:applicant_type, :name, :email, :password, :current_password)}
        end
    
end
