class ApplicantInformationsController < ApplicationController
    def new
        @applicant=ApplicantInformation.new
    end

    def create
        @applicant=current_user.create_applicant_information(applicant_params)
        redirect_to user_path(current_user)
    end

    
    def candidate_rejection
        @rejection=User.find(params[:user_id])
        @rejection.applicant_information.update(status:"rejected")
        redirect_to  user_interview_requests_path(current_user)
    end

    def update_applicant_information_status_to_accepted
        @update_status_to_accpeted = User.find(params[:user_id])
        @update_status_to_accpeted.applicant_information.update(status:"accepted")
        redirect_to user_scheduled_interviews_path(current_user)    
    end

    def update_applicant_information_status_to_rejected
        @update_status_to_rejected= User.find(params[:user_id])
        @update_status_to_rejected.applicant_information.update(status:"rejected")
        redirect_to user_scheduled_interviews_path(current_user)
    end
    
    private
        def applicant_params
            params.require(:applicant_information).permit(:major, :stream, :bio, :tenth_percentage, :twelth_percentage, :tech_stack, :contact_number)
        end
end
