class AddColumnToFriends < ActiveRecord::Migration
  def change
    add_column :mutual_friends, :picture, :text
  end
end
