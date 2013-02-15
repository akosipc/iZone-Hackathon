class MutualFriend < ActiveRecord::Base
  attr_accessible :email, :name, :username, :applicant_id

  belongs_to :applicant
end
