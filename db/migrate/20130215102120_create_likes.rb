class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.string :name
      t.string :link
      t.string :category
      t.integer :applicant_id
      t.timestamps
    end
  end
end
