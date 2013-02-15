class Image < ActiveRecord::Base
  attr_accessible :link, :applicant_id
  
  belongs_to :applicant
end
