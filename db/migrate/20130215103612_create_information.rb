class CreateInformation < ActiveRecord::Migration
  def change
    create_table :information do |t|
      t.string :email
      t.text :history
      t.text :about_you
      t.string :birthday
      t.string :gender
      t.string :relationship_status
      t.string :address
      t.string :contact_no
      t.integer :user_id
      t.timestamps
    end
  end
end
