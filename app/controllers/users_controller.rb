class UsersController < ApplicationController
    def interview_requests
        @all_applicants = User.all
    end

    def profile
        @user_profile= User.find(params[:user_id]).applicant_information
    end

    def interviewer_profile

    end
end
