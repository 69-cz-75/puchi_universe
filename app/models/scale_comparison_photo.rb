class ScaleComparisonPhoto < ApplicationRecord
  belongs_to :user

  validates :product_name, presence: true
  validate :validate_image_count

  mount_uploaders :images, ScaleComparisonPhotoUploader

  def validate_image_count
    # ここで設定した数値が最大の許容枚数
    max_image_count = 10

    if images.length > max_image_count
      errors.add(:images, "は#{max_image_count}枚までアップロードできます。")
    end
  end
end
