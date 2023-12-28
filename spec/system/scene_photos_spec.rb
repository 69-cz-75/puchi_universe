require 'rails_helper'

RSpec.describe "ScenePhotos", type: :system do
  scenario "ScenePhotoに投稿ができる" do
    user = FactoryBot.create(:user)

    visit new_user_session_path
    fill_in 'メールアドレス', with: user.email
    fill_in 'パスワード', with: user.password
    click_button 'ログイン'
    expect(page).to have_content 'ログインしました'

    find('label[for="my-drawer-3"].btn.btn-square.btn-ghost').click
    click_link "美術館に投稿"

    attach_file('scene_photo_images', Rails.root.join('spec', 'fixtures', 'test_image1.jpg'))
    fill_in "scene_photo_title", with: 'test title'
    fill_in "scene_photo_caption", with: 'test caption'
    fill_in "tag_names", with: 'test,テスト'

    click_button "投稿する"
    expect(page).to have_current_path(galleries_path)

    click_link "test title"
    expect(page).to have_content '編集する'
    expect(page).to have_content 'test title'
    expect(page).to have_content 'test caption'
    expect(page).to have_content 'test テスト'
  end
end