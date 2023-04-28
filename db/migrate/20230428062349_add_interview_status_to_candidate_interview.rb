class AddInterviewStatusToCandidateInterview < ActiveRecord::Migration[5.2]
  def change
    add_column :candidate_interviews, :interview_status, :string, default: "pending"
  end
end
