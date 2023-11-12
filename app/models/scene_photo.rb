class ScenePhoto < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, length: { maximum: 32 }
  validates :caption, length: { maximum: 3000 }
end
