class MutualFriend < ActiveRecord::Base
  attr_accessible :email, :name, :username, :user_id,:picture

  belongs_to :user
end
