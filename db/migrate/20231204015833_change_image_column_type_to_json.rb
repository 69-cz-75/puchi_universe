class ChangeImageColumnTypeToJson < ActiveRecord::Migration[7.0]
  def up
    change_column :scene_photos, :image, :json, using: 'image::json', null: false
  end

  def down
    change_column :scene_photos, :image, :string, null: false
  end
end
