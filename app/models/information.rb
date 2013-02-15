class Information < ActiveRecord::Base
  attr_accessible :about_you, :address, :birthday, :contact_no, :email, :gender, :history, :relationship_status, :user_id
  
  belongs_to :user
end
