class AddImageToScaleComparisonPhotos < ActiveRecord::Migration[7.0]
  def change
    add_column :scale_comparison_photos, :image, :string
  end
end
