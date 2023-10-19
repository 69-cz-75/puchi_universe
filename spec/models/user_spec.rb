require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー登録' do
    it "email、password、password_confirmationでユーザー登録ができる" do
      user = build(:user)
      expect(user).to be_valid  # user.valid? が true になればパスする
    end
  end
end
