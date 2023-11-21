class ScenePhoto < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, length: { maximum: 32 }
  validates :caption, length: { maximum: 3000 }

  #scene_photos/_form.html.erbのtitleにvalue: ''を設定。消さないこと。
  #タイトルが未入力の場合submit時に無題というタイトルが挿入される。
  before_validation :set_default_title

  private

  def set_default_title
    self.title = I18n.t('scene_photos.untitled') if title.blank?
  end
end
