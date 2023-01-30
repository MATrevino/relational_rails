class CreateCoffeeShop < ActiveRecord::Migration[5.2]
  def change
    create_table :coffee_shops do |t|
      t.string :name
      t.integer :open_year
      t.boolean :open_after_five
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
