class ScaleComparisonPhotosController < ApplicationController
  def index
    @scale_comparison_photos = ScaleComparisonPhoto.includes(:tag).all.order(created_at: :desc)
  end
end