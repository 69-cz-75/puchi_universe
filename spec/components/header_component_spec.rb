# frozen_string_literal: true

require "rails_helper"

RSpec.describe HeaderComponent, type: :component do
  it "ロゴの表示" do
    render_inline(HeaderComponent.new(header: 'Myheader'))

    expect(page).to have_selector("img[alt='header_logo']")
  end

  it "検索アイコンの表示" do
    within ".navbar-end" do
      expect(page).to have_css("button.btn.btn-ghost")
      expect(page).to have_css("button.btn.btn-ghost svg[h-5][w-5]")
    end
  end

  it "ハンバーガーアイコンの表示" do
    render_inline(HeaderComponent.new(header: 'Myheader'))

    # ハンバーガーアイコンが存在することをテスト
    expect(page).to have_selector("svg[xmlns*='http://www.w3.org/2000/svg']")

    # パス要素が存在することをテスト
    expect(page).to have_css("path[stroke-linecap='round'][stroke-linejoin='round'][stroke-width='2']")

    # パスの属性や形状をテストするには、正確なパスデータを指定してテストします
    # パスデータは "d" 属性にあります
    expect(page).to have_css("path[d='M4 6h16M4 12h16M4 18h16']")
  end
end
