require 'rails_helper'

RSpec.describe Tag, type: :model do
  it "任意のタグを登録できる" do
    tag = Tag.new(name: "Example Tag")
    expect(tag).to be_valid
  end
end
