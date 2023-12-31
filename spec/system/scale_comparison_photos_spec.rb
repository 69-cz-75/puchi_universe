require 'rails_helper'

RSpec.describe "ScaleComparisonPhotos", type: :system do
  scenario "ScenePhotoに投稿ができる" do
    user = FactoryBot.create(:user)

    visit new_user_session_path
    fill_in 'メールアドレス', with: user.email
    fill_in 'パスワード', with: user.password
    click_button 'ログイン'
    expect(page).to have_content 'ログインしました'

    find('label[for="my-drawer-3"].btn.btn-square.btn-ghost').click
    click_link "博物館に投稿"

    attach_file('scale_comparison_photo_images', Rails.root.join('spec', 'fixtures', 'test_image1.jpg'))
    fill_in "scale_comparison_photo_product_name", with: 'test product name'
    fill_in "scale_comparison_photo_company", with: 'test company'
    select '5', from: 'scale_comparison_photo_kind'
    fill_in "scale_comparison_photo_content", with: 'test content'

    click_button "投稿する"
    expect(page).to have_current_path(museums_path)

    click_link "test product name"
    expect(page).to have_content 'test product name'
    expect(page).to have_content 'test company'
    expect(page).to have_content '5種類'
    expect(page).to have_content 'test content'
  end
end