require 'rails_helper'

RSpec.describe ScaleComparisonPhoto, type: :model do
  describe "バリデーションのテスト" do
    let(:user) { FactoryBot.create(:user) }
    let(:scale_comparison_photo) { FactoryBot.build(:scale_comparison_photo, user: user, images: nil) }

    it "product_nameが存在しない場合にエラーが出る" do
      scale_comparison_photo.product_name = nil
      expect(scale_comparison_photo.valid?).to be false
    end
  end

  describe "imagesの数のテスト" do
    let(:user) { FactoryBot.create(:user) }
    let(:scale_comparison_photo) { FactoryBot.build(:scale_comparison_photo, user: user, images: nil) }

    before do
      scale_comparison_photo.product_name = "Example Product"
    end

    it "画像が10枚以下なら登録されること" do
      10.times do
        image_path = Rails.root.join('spec', 'fixtures', 'test_image1.jpg')
        scale_comparison_photo.images << File.open(image_path)
      end

      expect(scale_comparison_photo.valid?).to be true
    end

    it "画像が10枚以上なら登録されないこと" do
      11.times do
        image_path = Rails.root.join('spec', 'fixtures', 'test_image1.jpg')
        scale_comparison_photo.images << File.open(image_path)
      end

      expect(scale_comparison_photo.valid?).to be false
    end
  end


end
