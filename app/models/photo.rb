class Photo < ApplicationRecord
  belongs_to :building
  has_one_attached :image
end
