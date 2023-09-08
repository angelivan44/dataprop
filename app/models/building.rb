class Building < ApplicationRecord
  belongs_to :user
  has_many :photos
  accepts_nested_attributes_for :photos, allow_destroy: true, reject_if: :all_blank
  validates :price, numericality: { greater_than_to: 0, message: "the price must be greater than 0" }
  validates :bathroom_count, numericality: { greater_than_or_equal_to: 0, message: "bathrooms be greater than or equal to 0" }
  validates :bedroom_count, numericality: { greater_than_or_equal_to: 0, message: "bedrooms be greater than or equal to 0" }

  validate :at_least_three_photos

  private

  def at_least_three_photos
    if photos.size < 3
      errors.add(:photos, "deben ser al menos 3")
    end
  end
end
