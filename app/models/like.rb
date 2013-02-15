class Like < ActiveRecord::Base
  attr_accessible :category, :link, :name, :user_id
  
  belongs_to :user
end
