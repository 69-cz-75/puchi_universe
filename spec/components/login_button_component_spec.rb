# frozen_string_literal: true

require "rails_helper"

RSpec.describe LoginButtonComponent, type: :component do
  it "ログインボタンの表示" do
    render_inline(LoginButtonComponent.new(loginbutton: 'Login in'))

    expect(rendered_content).to have_css('a.btn.btn-active.btn-ghost', text: I18n.t('defaults.login'))
  end
end
