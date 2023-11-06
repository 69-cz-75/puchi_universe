class GalleriesController < ApplicationController
  def index
    @scene_photos = ScenePhoto.all.includes(:user).order(created_at: :desc)
  end
end
