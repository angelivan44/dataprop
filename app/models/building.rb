class Building < ApplicationRecord
  belongs_to :user
  has_many :photos
  accepts_nested_attributes_for :photos, allow_destroy: true, reject_if: :all_blank
end
