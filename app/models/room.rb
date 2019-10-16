class Room < ApplicationRecord
  belongs_to :user
  has_many :amenities
  geocoded_by :address
  after_validation :geocode
  
end
