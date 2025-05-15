class CreateCars < ActiveRecord::Migration[8.0]
  def change
    create_table :cars do |t|
      t.string :brand
      t.string :model
      t.integer :year
      t.string :fuel
      t.references :owner, null: false, foreign_key: true

      t.timestamps
    end
  end
end
