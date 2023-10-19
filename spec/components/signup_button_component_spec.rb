# frozen_string_literal: true

require "rails_helper"

RSpec.describe SignupButtonComponent, type: :component do
  it "ログインボタンの表示" do
    render_inline(SignupButtonComponent.new(signupbutton: 'Sign up'))

    expect(rendered_content).to have_css('a.btn.btn-active.btn-accent', text: 'Sign up')
  end
end
