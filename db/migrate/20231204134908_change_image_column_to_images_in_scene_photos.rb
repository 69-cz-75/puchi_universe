class ChangeImageColumnToImagesInScenePhotos < ActiveRecord::Migration[7.0]
  def change
    rename_column :scene_photos, :image, :images
  end
end
