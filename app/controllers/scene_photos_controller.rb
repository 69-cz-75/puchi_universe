class ScenePhotosController < ApplicationController
  def index
    @scene_photos = ScenePhoto.all.order(created_at: :desc)
  end

  def new
    @scene_photo = ScenePhoto.new
  end

  def create
    @scene_photo = current_user.scene_photos.build(scene_photo_params)
    if @scene_photo.save
      redirect_to galleries_path, flash: { success: t('defaults.message.created') }
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def scene_photo_params
    params.require(:scene_photo).permit(:title, :caption, { images: [] })
  end
end
