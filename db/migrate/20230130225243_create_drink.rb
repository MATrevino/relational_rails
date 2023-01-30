class CreateDrink < ActiveRecord::Migration[5.2]
  def change
    create_table :drinks do |t|
      t.references :coffee_shop, index: true, foreign_key: true
      t.string :integer
      t.string :name
      t.boolean :hot_drink
      t.integer :price
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
