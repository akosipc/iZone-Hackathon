class Friend < ActiveRecord::Base
  attr_accessible :email, :name, :username, :user_id

  belongs_to :user
end
