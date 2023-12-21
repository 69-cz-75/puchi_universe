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
end
