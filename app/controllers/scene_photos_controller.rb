class ScenePhotosController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :set_scene_photo, only: %i[edit update destroy]

  def index
    @scene_photos = ScenePhoto.all.order(created_at: :desc)
  end

  def new
    @scene_photo = ScenePhoto.new
  end

  def create
    @scene_photo = current_user.scene_photos.build(scene_photo_params)
    if @scene_photo.save_with_tags(tag_names: params.dig(:scene_photo, :tag_names).split(',').uniq)
      redirect_to galleries_path, flash: { success: t('defaults.message.created') }
    else
      @scene_photo_title = @scene_photo.title
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @scene_photo = ScenePhoto.find(params[:id])
  end

  private

  def scene_photo_params
    params.require(:scene_photo).permit(:title, :caption, { images: [] })
  end

  def set_scene_photo
    @scene_photo = current_user.scene_photos.find(params[:id])
  end
end
