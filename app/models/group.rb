class Group < ActiveRecord::Base
  attr_accessible :description, :link, :name, :user_id


  belongs_to :user
end
