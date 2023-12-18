class ScenePhoto < ApplicationRecord
  belongs_to :user
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings

  validates :title, presence: true, length: { maximum: 32 }
  validates :caption, length: { maximum: 3000 }
  validates :images, presence: true
  validate :validate_image_count

  #scene_photos/_form.html.erbのtitleに[value: '']を設定。消さないこと。
  #タイトルが未入力の場合submit時に無題というタイトルが挿入される。
  before_validation :set_default_title

  scope :with_tag, ->(tag_name) { joins(:tags).where(tags: { name: tag_name }) }

  mount_uploaders :images, ScenePhotoUploader

  def save_with_tags(tag_names:)
    ActiveRecord::Base.transaction do
      self.tags = tag_names.map { |name| Tag.find_or_initialize_by(name: name.strip) }
      save!
    end
    true
  rescue StandardError
    false
  end

  def tag_names
    tags.map(&:name).join(',')
  end

  private

  def set_default_title
    self.title = I18n.t('scene_photos.untitled') if title.blank?
  end

  def validate_image_count
    # ここで設定した数値が最大の許容枚数
    max_image_count = 3

    if images.length > max_image_count
      errors.add(:images, "は#{max_image_count}枚までアップロードできます。")
    end
  end
end
