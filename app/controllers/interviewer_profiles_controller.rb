class InterviewerProfilesController < ApplicationController
    def new
        @interviewer=InterviewerProfile.new
    end

    def create
        @interview=current_user.create_interviewer_profile(interview_profile_params)
        redirect_to root_path
    end

    private
        def interview_profile_params
            params.require(:interviewer_profile).permit(:exp, :bio, :tech_stack, :skillset)
        end
end
