class ScaleComparisonPhoto < ApplicationRecord
  belongs_to :user

  validates :product_name, presence: true

  mount_uploader :image, ScaleComparisonPhotoUploader
end
