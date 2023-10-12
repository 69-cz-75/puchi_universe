class ApplicationController < ActionController::Base
  #header_componentでのログアウトボタンの設置に必要
  #これがないとview_component内でcurrent_userが未定義でエラーが出る
  helper_method :current_user
end
