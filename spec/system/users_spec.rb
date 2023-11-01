require 'rails_helper'

RSpec.describe "Users", type: :system do
  let(:user) { create(:user) }
  let(:profile) { create(:profile, user: user) }

  scenario "新規ユーザー登録ができる" do
    visit root_path
    find('label[for="my-drawer-3"].btn.btn-square.btn-ghost').click #ハンバーガーアイコンをクリック
    click_link "アカウントを作成"
    fill_in "メールアドレス", with: user.email
    fill_in "パスワード", with: user.password
    fill_in "ユーザー名", with: profile.name
    choose("gender-male")

    # 誕生日の入力
    select '2012', from: 'user_profile_attributes_birthdate_1i' # 年を選択
    select '1', from: 'user_profile_attributes_birthdate_2i'     # 月を選択
    select '2', from: 'user_profile_attributes_birthdate_3i'    # 日を選択

    click_button "アカウントを作成" 

    expect(page).to have_current_path(root_path)
  end
end
