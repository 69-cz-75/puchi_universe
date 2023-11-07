class GalleriesController < ApplicationController
  def index
    @galleries = ScenePhoto.all.includes(:user).order(created_at: :desc)
  end
end
