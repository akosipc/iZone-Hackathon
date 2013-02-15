class MutualFriend < ActiveRecord::Base
  attr_accessible :email, :name, :username, :user_id,:picture

  validates :username, :uniqueness => true

  belongs_to :user
end
