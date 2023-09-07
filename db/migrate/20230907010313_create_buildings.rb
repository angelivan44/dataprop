class CreateBuildings < ActiveRecord::Migration[7.0]
  def change
    create_table :buildings do |t|
      t.string :transaction_type
      t.float :price
      t.string :address
      t.float :area_sq_meter
      t.integer :bedroom_count
      t.integer :bathroom_count
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
