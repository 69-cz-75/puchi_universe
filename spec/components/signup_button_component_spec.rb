# frozen_string_literal: true

require "rails_helper"

RSpec.describe SignupButtonComponent, type: :component do
  it "アカウント登録ボタンの表示" do
    render_inline(SignupButtonComponent.new(signupbutton: 'Sign up'))

    expect(rendered_content).to have_css('a.btn.btn-active.btn-accent', text: I18n.t('defaults.signup'))
  end
end
