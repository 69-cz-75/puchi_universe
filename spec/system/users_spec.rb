require 'rails_helper'

RSpec.describe "Users", type: :system do

  scenario "新規ユーザー登録ができる" do
    visit root_path
    find('label[for="my-drawer-3"].btn.btn-square.btn-ghost').click #ハンバーガーアイコンをクリック
    click_link "アカウントを作成"
    fill_in "メールアドレス", with: 'user_1@example.com'
    fill_in "パスワード", with: 'password'
    fill_in "ユーザー名", with: 'john'
    choose("gender_male")

    # 誕生日の入力
    select '2012', from: 'user_profile_attributes_birthdate_1i' # 年を選択
    select '1', from: 'user_profile_attributes_birthdate_2i'     # 月を選択
    select '2', from: 'user_profile_attributes_birthdate_3i'    # 日を選択

    click_button "アカウントを作成" 

    #以下のfindが二つないとうまくハンバーガアイコンをクリックしてくれない
    #やってること一緒だけど他にどっちかをコメントアウトするとテストがうまくいかないのでこのままでいく
    find('#humberger-icon', wait: 10).click
    find('label[for="my-drawer-3"].btn.btn-square.btn-ghost').click #ハンバーガーアイコンをクリック

    expect(page).to have_selector('#logout-button', text: 'ログアウト')
  end

  scenario "間違えたメールアドレスだとログインできない" do
    visit new_user_session_path
    fill_in 'メールアドレス', with: 'nonexistent@example.com'
    fill_in 'パスワード', with: 'password123'
    click_button 'ログイン'

    expect(page).to have_content 'メールアドレス もしくはパスワードが不正です。'
  end
end
