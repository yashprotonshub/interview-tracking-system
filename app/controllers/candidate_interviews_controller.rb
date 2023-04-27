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

    private
        def candidate_interview_params
            params.require(:candidate_interview).permit(:feedback, :time_slot, :interviewer_name, :information, :candidate)
        end   
end
