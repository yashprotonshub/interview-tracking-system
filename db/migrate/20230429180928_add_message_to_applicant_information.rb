class AddMessageToApplicantInformation < ActiveRecord::Migration[5.2]
  def change
    add_column :applicant_informations, :message, :text, default: "no message"
  end
end
