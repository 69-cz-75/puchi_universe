class ScenePhotosController < ApplicationController
  def index
    @scene_photos = ScenePhoto.all.order(created_at: :desc)
  end

  def new
    @scene_photo = ScenePhoto.new
  end

  def create
    @scene_photo = current_user.scene_photos.build(scene_photo)
    if @scene_photo.save
      redirect_to galleries_path, success: t('defaults.message.created', item: Board.model_name.human)
    else
      flash.now['danger'] = t('defaults.message.not_created', item: Board.model_name.human)
      render :new
    end
  end

  private

  def scene_photo_params
    params.require(:scene_photo).permit(:title, :caption)
  end
end
