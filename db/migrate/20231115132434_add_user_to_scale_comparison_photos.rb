class AddUserToScaleComparisonPhotos < ActiveRecord::Migration[7.0]
  def change
    add_reference :scale_comparison_photos, :user, null: false, foreign_key: true
  end
end
