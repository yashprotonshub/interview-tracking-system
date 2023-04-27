class CreateCandidateInterviews < ActiveRecord::Migration[5.2]
  def change
    create_table :candidate_interviews do |t|
      t.text :time_slot
      t.text :information
      t.text :feedback, default: "None", null: false
      t.string :interviewer_name
      t.integer :candidate
      t.timestamps
    end
  end
end
