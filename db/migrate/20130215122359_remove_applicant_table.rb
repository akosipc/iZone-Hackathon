class RemoveApplicantTable < ActiveRecord::Migration
  def change
    drop_table :applicants
  end
end
