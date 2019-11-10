class Room < ApplicationRecord
  geocoded_by :address
  after_validation :geocode
  belongs_to :user
  has_many :amenities
  geocoded_by :address
  after_validation :geocode
  # has_many :photos
  has_many_attached :images
  has_many :reservations
  has_many :guest_reviews

  # def thumbnail input
 #    return self.images[input].variant(resize: "1200x500").processed
 #  end


def average_rating
  guest_reviews.count == 0 ? 0 : guest_reviews.average(:star).round(2).to_i
end

end




