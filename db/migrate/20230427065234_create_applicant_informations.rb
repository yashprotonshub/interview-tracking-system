class CreateApplicantInformations < ActiveRecord::Migration[5.2]
  def change
    create_table :applicant_informations do |t|
      t.string :stream
      t.string :major
      t.float :tenth_percentage
      t.float :twelth_percentage
      t.text :tech_stack
      t.text :bio
      t.integer :contact_number
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
