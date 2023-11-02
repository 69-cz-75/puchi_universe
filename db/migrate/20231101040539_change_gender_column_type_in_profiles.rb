class ChangeGenderColumnTypeInProfiles < ActiveRecord::Migration[7.0]
  def change
    remove_column :profiles, :gender, :string
    add_column :profiles, :gender, :integer, null: false
  end
end
