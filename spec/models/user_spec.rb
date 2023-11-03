require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー登録' do
    it "email、password、ユーザー名、性別、生年月日でユーザー登録ができる" do
      user = build(:user)
      profile = build(:profile)
      user.profile = profile
      expect(user).to be_valid  # user.valid? が true になればパスする
    end
  end
end
