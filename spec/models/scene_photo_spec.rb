require 'rails_helper'

RSpec.describe ScenePhoto, type: :model do
  describe "タグの操作" do
    let(:user) { FactoryBot.create(:user) }
    let(:scene_photo) { FactoryBot.build(:scene_photo, user: user, images: nil) }

    before do
      # 画像ファイルを添付する（CarrierWaveを使用する場合）
      image_path = Rails.root.join('spec', 'fixtures', 'test_image1.jpg')
      scene_photo.images = [File.open(image_path)]

      scene_photo.save!
    end

    it "複数のタグを持つこと" do
      tag1 = FactoryBot.create(:tag)
      tag2 = FactoryBot.create(:tag)

      scene_photo.tags << tag1
      scene_photo.tags << tag2

      expect(scene_photo.tags.count).to eq(2)
    end

    it "タグを削除することができる" do
      tag1 = FactoryBot.create(:tag)
      tag2 = FactoryBot.create(:tag)

      scene_photo.tags << tag1
      scene_photo.tags << tag2

      expect(scene_photo.tags.count).to eq(2)

      tag_to_remove = scene_photo.tags.first
      scene_photo.tags.destroy(tag_to_remove)

      expect(scene_photo.tags.count).to eq(1)
    end
  end

  describe "titleのテスト" do
    let(:user) { FactoryBot.create(:user) }
    let(:scene_photo) { FactoryBot.build(:scene_photo, user: user, images: nil) }

    before do
      image_path = Rails.root.join('spec', 'fixtures', 'test_image1.jpg')
      scene_photo.images = [File.open(image_path)]

      scene_photo.save!
    end

    it "titleが32文字以上でエラーが出ること" do
      scene_photo.title = "a" * 33
      expect(scene_photo.valid?).to be false
    end

    it "titleが32文字以下であること" do
      scene_photo.title = "a" * 32
      expect(scene_photo.valid?).to be true
    end

    it "任意のtitleが入る" do
      custom_title = "Custom Title"
      scene_photo.title = custom_title
      expect(scene_photo.title).to eq(custom_title)
    end

    it "titleが未入力の場合、デフォルトタイトルが設定されること" do
      scene_photo.title = ""
      scene_photo.valid?
      expect(scene_photo.title).to eq(I18n.t('scene_photos.untitled'))
    end
  end

  describe "captionのテスト" do
    let(:user) { FactoryBot.create(:user) }
    let(:scene_photo) { FactoryBot.build(:scene_photo, user: user, images: nil) }

    before do
      image_path = Rails.root.join('spec', 'fixtures', 'test_image1.jpg')
      scene_photo.images = [File.open(image_path)]

      scene_photo.save!
    end

    it "captionが3000文字以上でエラーが出る" do
      scene_photo.caption = "a" * 3001
      expect(scene_photo.valid?).to be false
    end

    it "captionが3000文字以下であること" do
      scene_photo.caption = "a" * 3000
      expect(scene_photo.valid?).to be true
    end
  end

  describe "imagesのテスト" do
    let(:user) { FactoryBot.create(:user) }
    let(:scene_photo) { FactoryBot.build(:scene_photo, user: user, images: nil) }

    it "imagesが存在すること" do
      scene_photo.images = nil
      expect(scene_photo.valid?).to be false
    end
  end

  describe "imagesの数のテスト" do
    let(:user) { FactoryBot.create(:user) }
    let(:scene_photo) { FactoryBot.build(:scene_photo, user: user, images: []) }

    it "画像が3枚以下なら登録されること" do
      3.times do
        image_path = Rails.root.join('spec', 'fixtures', 'test_image1.jpg')
        scene_photo.images << File.open(image_path)
      end

      expect(scene_photo.valid?).to be true
    end
  end

  describe "imagesの数のテスト" do
    let(:user) { FactoryBot.create(:user) }
    let(:scene_photo) { FactoryBot.build(:scene_photo, user: user, images: []) }

    it "画像が3枚以上登録された場合にエラーが発生すること" do
      4.times do
        image_path = Rails.root.join('spec', 'fixtures', 'test_image1.jpg')
        scene_photo.images << File.open(image_path)
      end

      scene_photo.valid?
      expect(scene_photo.errors[:images]).to include("は3枚までアップロードできます。")
    end
  end
end
