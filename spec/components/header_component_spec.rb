# frozen_string_literal: true

require "rails_helper"

RSpec.describe HeaderComponent, type: :component do
  it "ロゴの表示" do
    render_inline(HeaderComponent.new(header: 'Myheader'))

    expect(page).to have_selector("img[alt='header_logo']")
  end

end
