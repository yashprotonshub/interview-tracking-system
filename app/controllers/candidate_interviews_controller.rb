class CandidateInterviewsController < ApplicationController
    def new
        @appointment= CandidateInterview.new
        @interviewer_name= User.where(applicant_type:"Interviewer").pluck(:name)
    end

    def create
        @appointment= CandidateInterview.new(candidate_interview_params)
        @updating_status_of_candidate= User.find(params[:user_id].to_i).applicant_information
        @updating_status_of_candidate.update(status:"scheduled")
        @appointment.save
        redirect_to root_path
    end

    def update_candidate_interview_status
        @update_candidate_interview_status=CandidateInterview.find_by(candidate:params[:user][:candidate].to_i,interviewer_name:User.find(params[:user_id].to_i).name)
        @update_candidate_interview_status.update(interview_status:params[:user]["interview_status"])
        redirect_to user_all_scheduled_interviews_for_interviewers_path(current_user)
    end

    def update_candidate_interview_status_entry
        @candidate_name= params[:candidate_name].to_i
    end

    private
        def candidate_interview_params
            params.require(:candidate_interview).permit(:feedback, :time_slot, :interviewer_name, :information, :candidate)
        end   
end
