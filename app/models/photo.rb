class Photo < ApplicationRecord
  before_create :set_primary
  belongs_to :building
  has_one_attached :image

  def set_primary
    if self.building.photos.where(primary: true).none?
      self.primary = true
    end
  end
end