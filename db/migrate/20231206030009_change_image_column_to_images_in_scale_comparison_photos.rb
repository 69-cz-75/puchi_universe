class ChangeImageColumnToImagesInScaleComparisonPhotos < ActiveRecord::Migration[7.0]
  def change
    rename_column :scale_comparison_photos, :image, :images
  end
end
