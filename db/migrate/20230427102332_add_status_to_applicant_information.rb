class AddStatusToApplicantInformation < ActiveRecord::Migration[5.2]
  def change
    add_column :applicant_informations, :status, :string, default: "pending", null: false

  end
end
