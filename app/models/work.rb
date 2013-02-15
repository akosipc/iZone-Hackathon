class Work < ActiveRecord::Base
  attr_accessible :name, :position, :user_id

  belongs_to :user
end
