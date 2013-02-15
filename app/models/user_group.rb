class UserGroup < ActiveRecord::Base
  attr_accessible :location, :name

  has_many :users

  validates_presence_of :name, :location
  validates_uniqueness_of :name
end
