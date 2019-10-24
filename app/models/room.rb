class Room < ApplicationRecord


  belongs_to :user
  has_many :amenities
  geocoded_by :address
  after_validation :geocode
  has_many :photos
  has_one_attached :image

end




