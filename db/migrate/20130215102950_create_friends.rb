class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
      t.string :name
      t.string :email
      t.string :username
      t.integer :applicant_id
      t.timestamps
    end
  end
end
