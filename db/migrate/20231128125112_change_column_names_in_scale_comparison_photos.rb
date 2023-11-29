class ChangeColumnNamesInScaleComparisonPhotos < ActiveRecord::Migration[7.0]
  def up
    rename_column :scale_comparison_photos, :kinds, :kind
    rename_column :scale_comparison_photos, :contents, :content
  end

  def down
    rename_column :scale_comparison_photos, :kind, :kinds
    rename_column :scale_comparison_photos, :content, :contents
  end
end
