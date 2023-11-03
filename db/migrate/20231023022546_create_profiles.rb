class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.string :name, null: false
      t.date :birthdate, null: false
      t.string :gender, null: false

      t.timestamps
    end
  end
end
