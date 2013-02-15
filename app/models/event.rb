class Event < ActiveRecord::Base
  attr_accessible :name, :place, :time, :user_id
  
  belongs_to :user
end
