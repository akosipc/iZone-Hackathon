class Group < ActiveRecord::Base
  attr_accessible :description, :link, :name, :applicant_id

  belongs_to :applicant

end
