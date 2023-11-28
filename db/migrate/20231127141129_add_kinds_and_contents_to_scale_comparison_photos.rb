class AddKindsAndContentsToScaleComparisonPhotos < ActiveRecord::Migration[7.0]
  def change
    add_column :scale_comparison_photos, :kinds, :integer
    add_column :scale_comparison_photos, :contents, :text
  end
end
