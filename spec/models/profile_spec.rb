require 'rails_helper'

RSpec.describe Profile, type: :model do
  it "プロフィールの登録ができる" do
    user = User.create(email: "test@example.com", password: "password")
    profile = described_class.new(name: "John", gender: :male, birthdate: Date.new(1990, 1, 1), user: user)
    expect(profile).to be_valid
  end

  it "名前が未入力だと登録できない" do
    profile = described_class.new(gender: :male, birthdate: Date.new(1990, 1, 1))
    expect(profile).to_not be_valid
  end

  it "性別が未入力だと登録できない" do
    profile = described_class.new(name: "John", birthdate: Date.new(1990, 1, 1))
    expect(profile).to_not be_valid
  end

  it "誕生日が未入力だと登録できない" do
    profile = described_class.new(name: "John", gender: :male)
    expect(profile).to_not be_valid
  end
end
