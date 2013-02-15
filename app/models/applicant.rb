class Applicant < ActiveRecord::Base
  attr_accessible :email, :facebook_username, :name
  
  validates :email, presence: true
  validates :name, presence: true

  has_many :events
  has_many :friends
  has_many :groups
  has_many :images
  has_many :informations
  has_many :likes
  has_many :mutual_friends
  has_many :works
end
