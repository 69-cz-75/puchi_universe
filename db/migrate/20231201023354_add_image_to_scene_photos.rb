class AddImageToScenePhotos < ActiveRecord::Migration[7.0]
  def change
    add_column :scene_photos, :image, :string, null: false
  end
end
