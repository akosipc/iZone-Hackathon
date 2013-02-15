class Event < ActiveRecord::Base
  attr_accessible :name, :place, :time, :applicant_id
  
  belongs_to :applicant
end
