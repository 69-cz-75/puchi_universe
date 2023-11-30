class ScaleComparisonPhotosController < ApplicationController
  def index
    @scale_comparison_photos = ScaleComparisonPhoto.all.order(created_at: :desc)
  end

  def new
    @scale_comparison_photo = ScaleComparisonPhoto.new
  end

  def create
    @scale_comparison_photo = current_user.scale_comparison_photos.build(scale_comparison_photo_params)
    if @scale_comparison_photo.save
      redirect_to museums_path, flash: { success: t('defaults.message.created') }
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def scale_comparison_photo_params
    params.require(:scale_comparison_photo).permit(:product_name, :company, :kind, :content)
  end
end
