class Tag < ApplicationRecord
  has_one :scale_comparison_photo

  validates :name, presence: true
end
