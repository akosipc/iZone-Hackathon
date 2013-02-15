class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :time
      t.text :place
      t.integer :user_id
      t.timestamps
    end
  end
end
