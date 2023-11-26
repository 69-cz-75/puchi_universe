class AddProductNameToScaleComparisonPhotos < ActiveRecord::Migration[7.0]
  def change
    add_column :scale_comparison_photos, :product_name, :string, null: false
    remove_column :scale_comparison_photos, :tag_id
  end
end
