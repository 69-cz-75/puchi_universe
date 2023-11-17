class ScenePhotosController < ApplicationController
  def index
    @scene_photos = ScenePhoto.all.order(created_at: :desc)
  end
end
