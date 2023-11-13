class CreateScaleComparisonPhotos < ActiveRecord::Migration[7.0]
  def change
    create_table :scale_comparison_photos do |t|
      t.string :company
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
