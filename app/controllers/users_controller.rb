class UsersController < ApplicationController
    def interview_requests
        @all_applicants = User.all
    end

    def profile
        @user_profile= User.find(params[:user_id])
    end

    def user_status
        @user_status= User.find(params[:user_id]).applicant_information.status
    end

    def all_interviewers_list
        @all_interviewers= User.where(applicant_type:"Interviewer")
    end
end
