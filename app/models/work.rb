class Work < ActiveRecord::Base
  attr_accessible :name, :position, :applicant_id

  belongs_to :applicant
end
