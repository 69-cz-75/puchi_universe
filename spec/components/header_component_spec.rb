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
end
