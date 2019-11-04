class Room < ApplicationRecord
  belongs_to :user
  has_many :amenities
  geocoded_by :address
  after_validation :geocode
  # has_many :photos
  has_many_attached :images
  has_many :reservations
  has_many :reviews
  # def thumbnail input
 #    return self.images[input].variant(resize: "1200x500").processed
 #  end

end




