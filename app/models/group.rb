class Group < ActiveRecord::Base
  attr_accessible :name, :location

  has_many :users

  validates_presence_of :name, :location
  validates_uniqueness_of :name
end
