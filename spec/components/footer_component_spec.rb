# frozen_string_literal: true

require "rails_helper"

RSpec.describe FooterComponent, type: :component do
  it "利用規約の表示" do
    render_inline(FooterComponent.new(footer: 'Myfooter'))

    expect(rendered_content).to have_css("a.link.link-hover", text: '利用規約')
  end

  it "プライバシーポリシーの表示" do
    render_inline(FooterComponent.new(footer: 'Myfooter'))

    expect(rendered_content).to have_css("a.link.link-hover", text: 'プライバシーポリシー')
  end

  it "お問い合わせ" do
    render_inline(FooterComponent.new(footer: 'Myfooter'))

    expect(rendered_content).to have_css("a.link.link-hover", text: 'お問い合わせ')
  end
end
