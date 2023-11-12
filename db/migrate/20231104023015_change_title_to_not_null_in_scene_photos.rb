class ChangeTitleToNotNullInScenePhotos < ActiveRecord::Migration[7.0]
  def up
    change_column :scene_photos, :title, :string, null: false, default: 'Untitled'
  end

  def down
    change_column :scene_photos, :title, :string, null: true
  end
end
