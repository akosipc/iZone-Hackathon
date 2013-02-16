class Group < ActiveRecord::Base
  attr_accessible :description, :link, :name, :user_id,:bookmard_order

  belongs_to :user
end
