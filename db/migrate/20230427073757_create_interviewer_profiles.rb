class CreateInterviewerProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :interviewer_profiles do |t|
      t.float :exp
      t.text :skillset
      t.text :bio
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
