class ScenePhoto < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, length: { maximum: 32 }
  validates :caption, length: { maximum: 3000 }

  before_validation :set_default_title

  private

  def set_default_title
    self.title = 'Untitled' if title.blank?
  end
end
