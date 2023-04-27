class ApplicantInformationsController < ApplicationController
    def new
        @applicant=ApplicantInformation.new
    end

    def create
        @applicant=current_user.create_applicant_information(applicant_params)
        redirect_to user_path(current_user)
    end

    private
        def applicant_params
            params.require(:applicant_information).permit(:major, :stream, :bio, :tenth_percentage, :twelth_percentage, :tech_stack, :contact_number)
        end
end
