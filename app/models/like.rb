class Like < ActiveRecord::Base
  attr_accessible :category, :link, :name, :applicant_id
  
  belongs_to :user
end
