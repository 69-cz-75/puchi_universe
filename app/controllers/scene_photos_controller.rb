class ScenePhotosController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :set_scene_photo, only: %i[edit update destroy]

  def index
    @current_tag = params[:tag_name] if params[:tag_name].present?

    scene_photos =
      if (tag_name = params[:tag_name])
        ScenePhoto.with_tag(tag_name)
      else
        ScenePhoto.all
      end
    @scene_photos = scene_photos.order(created_at: :desc).page(params[:page]).per(24)
    @search_results_count = scene_photos.count
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

  def edit
    @scene_photo = current_user.scene_photos.find(params[:id])
    @scene_photo_title = @scene_photo.title || ''
  end

  def update
    @scene_photo = current_user.scene_photos.find(params[:id])
    if @scene_photo.update(scene_photo_params)
      redirect_to gallery_show_path(@scene_photo), success: t('defaults.message.updated')
    else
      @scene_photo_title = @scene_photo.title
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @scene_photo = current_user.scene_photos.find(params[:id])
    @scene_photo.destroy!
    redirect_to galleries_path, success: t('defaults.message.deleted')
  end

  private

  def scene_photo_params
    params.require(:scene_photo).permit(:title, :caption, { images: [] })
  end

  def set_scene_photo
    @scene_photo = current_user.scene_photos.find(params[:id])
  end
end
