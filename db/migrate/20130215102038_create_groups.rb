class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.string :link
      t.text :description
      t.integer :user_id
      t.timestamps
    end
  end
end
