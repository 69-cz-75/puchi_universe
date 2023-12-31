require 'rails_helper'

RSpec.describe Tagging, type: :model do
  it "ScenePhotoに任意のタグをつけられる" do
    tag = Tag.create(name: "Example Tag")
    scene_photo = ScenePhoto.create(title: "Example Photo", caption: "Example Caption", images: ["example.jpg"])
    tagging = Tagging.new(tag: tag, scene_photo: scene_photo)
    expect(tagging).to be_valid
  end

  it "ScenePhotoに画像がないとタグの登録ができない" do
    tag = Tag.create(name: "Example Tag")
    tagging = Tagging.new(tag: tag, scene_photo: nil)
    expect(tagging).not_to be_valid
  end
end
