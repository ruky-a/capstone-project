class Photo < ApplicationRecord
  belongs_to :room
  has_many_attached :images
end