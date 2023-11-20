class ScenePhotosController < ApplicationController
  def index
    @scene_photos = ScenePhoto.all.order(created_at: :desc)
  end

  def new
    @scene_photo = ScenePhoto.new
  end

  def create
    #投稿するボタンを押下した際にタイトルがnilまたは空の時は自動でuntitledを挿入する
    title = scene_photo_params[:title]
    title = I18n.t('scene_photos.untitled') if title.nil? || title.empty?
    @scene_photo = current_user.scene_photos.build(scene_photo_params.merge(title: title))
    if @scene_photo.save
      redirect_to galleries_path
    else
      render :new
    end
  end

  private

  def scene_photo_params
    params.require(:scene_photo).permit(:title, :caption)
  end
end
