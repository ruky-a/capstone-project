class Photo < ApplicationRecord
  belongs_to :room
  has_many_attached :images

  
   def thumbnail input
    return self.images[input].variant(resize: "300x300!").processed
  end
end

