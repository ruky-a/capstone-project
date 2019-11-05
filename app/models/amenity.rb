class Amenity < ApplicationRecord
  validates :hometype, presence: true
  validates :roomtype, presence: true
  validates :bedroom, presence: true
  validates :accommodate, presence: true
 
  belongs_to :room
end
