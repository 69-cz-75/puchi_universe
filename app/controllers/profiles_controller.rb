class ProfilesController < ApplicationController
  def new
    @profile = Profile.new
  end

  def create
    #profile_params = profile_params_with_date
    @profile = Profile.new(profile_params)
    if @profile.save
      # プロフィール情報が正常に保存された場合の処理
      redirect_to root_path, notice: "プロフィールが正常に保存されました"
    else
      render :new
    end
  end

  private

  def profile_params
    date_params = %w(birthday(1i) birthday(2i) birthday(3i))
    birthdate = Date.new(params["profile"][date_params[0]].to_i, params["profile"][date_params[1]].to_i, params["profile"][date_params[2]].to_i)
    params.require(:profile).permit(:name, :gender).merge(birthdate: birthdate)
  end
  
  
end