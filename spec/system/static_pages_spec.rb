require 'rails_helper'

RSpec.describe "StaticPages", type: :system do
  it "利用規約のページを取得できるか" do
    get terms_of_service_url
    expect(response).to have_http_status(:success)
  end

  it "プライバシーポリシーのページを取得できるか" do
    get privacy_policy_url
    expect(response).to have_http_status(:success)
  end
end
