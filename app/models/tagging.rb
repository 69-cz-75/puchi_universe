class Tagging < ApplicationRecord
  belongs_to :tag
  belongs_to :scene_photo

  validates :tag_id, uniqueness: { scope: :scene_photo_id }
end
