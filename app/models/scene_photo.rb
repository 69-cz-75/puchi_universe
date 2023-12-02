class ScenePhoto < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, length: { maximum: 32 }
  validates :caption, length: { maximum: 3000 }
  validates :image, presence: true

  #scene_photos/_form.html.erbのtitleに[value: '']を設定。消さないこと。
  #タイトルが未入力の場合submit時に無題というタイトルが挿入される。
  before_validation :set_default_title

  mount_uploader :image, ScenePhotoUploader

  private

  def set_default_title
    self.title = I18n.t('scene_photos.untitled') if title.blank?
  end
end
