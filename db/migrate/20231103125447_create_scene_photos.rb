class CreateScenePhotos < ActiveRecord::Migration[7.0]
  def change
    create_table :scene_photos do |t|
      t.string :title
      t.text :caption
      t.references :user,  null: false, foreign_key: true

      t.timestamps
    end
  end
end
