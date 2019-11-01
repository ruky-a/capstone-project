class Review < ApplicationRecord
  belongs_to :user
  belongs_to :room
  belongs_to :reservation
end
