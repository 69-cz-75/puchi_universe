class ApplicationController < ActionController::Base
  #header_componentでのログアウトボタンの設置に必要
  #これがないとview_component内でcurrent_userが未定義でエラーが出る
  helper_method :current_user

  #上記同様これがないとuser_signed_in?が未定義でエラーが出る
  helper_method :user_signed_in?
end
