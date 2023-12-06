class ChangeImageColumnTypeToJsonInScaleComparisonPhoto < ActiveRecord::Migration[7.0]
  def up
    change_column :scale_comparison_photos, :image, :json, using: 'image::json'
  end

  def down
    change_column :scale_comparison_photos, :image, :string
  end
end
