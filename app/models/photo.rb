class Photo < ApplicationRecord
  belongs_to :room
  has_many_attached :images

    
 def thumbnail input
    return self.images[input].variant(resize: "280x180").processed
  end


end