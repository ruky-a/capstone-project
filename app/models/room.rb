class Room < ApplicationRecord

  validates :listing_name, presence: true
  validates :description, presence: true
  validates :address, presence: true
  
  

 
  belongs_to :user
  has_many :amenities
  geocoded_by :address
  after_validation :geocode
  has_many :photos
  has_one_attached :image

end




