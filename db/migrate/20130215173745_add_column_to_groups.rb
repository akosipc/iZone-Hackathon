class AddColumnToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :bookmard_order, :integer
  end
end
