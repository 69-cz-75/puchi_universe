class MyPagesController < ApplicationController
  #def index
    #@user = current_user
    #@user_scene_photos = @user.scene_photos.order(created_at: :desc).page(params[:page]).per(12)

     # 現在のユーザーに関連するプロファイルを取得
    #@profile = @user.profile
  #end
  
  def show
    @user = User.find_by(id: params[:id])
    @profile = @user&.profile
  end

  
end
