class ScenePhoto < ApplicationRecord
  validates :title, length: { maximum: 32 }
  validates :caption, length: { maximum: 3000 }
end
