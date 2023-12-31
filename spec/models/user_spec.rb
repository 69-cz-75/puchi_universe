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

  describe 'ログイン' do
    it "正しいメールアドレスとパスワードでログインできる" do
      user = create(:user, email: 'test@example.com', password: 'password123')

      authenticated_user = User.find_for_authentication(email: 'test@example.com')

      expect(authenticated_user.valid_password?('password123')).to be true
    end
  end
end
