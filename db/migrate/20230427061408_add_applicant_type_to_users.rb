class AddApplicantTypeToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :applicant_type, :string
  end
end
