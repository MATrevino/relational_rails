require 'rails_helper'

describe Drink, type: :model do
  describe 'table attributes' do
    it 'returns name of drink' do
      coffee_shop_1 = CoffeeShop.create!(name: "Starbucks", open_year: 1971, open_after_five: true)

      drink_1 = Drink.create!(coffee_shop_id: coffee_shop_1, name: "Flat White", hot_drink: true, price: 3)

      expect(drink_1.name).to eq("Flat White")
    end

    it 'has a coffee shop' do
      coffee_shop_1 = CoffeeShop.create!(name: "Starbucks", open_year: 1971, open_after_five: true)

      drink_1 = Drink.create!(coffee_shop_id: coffee_shop_1, name: "Flat White", hot_drink: true, price: 3)

      expect(drink_1.coffee_shop_id).to eq(coffee_shop_1)
    end

    it 'returns true if the drink is hot' do
      coffee_shop_1 = CoffeeShop.create!(name: "Starbucks", open_year: 1971, open_after_five: true )

      drink_1 = Drink.create!(coffee_shop_id: coffee_shop_1, name: "Flat White", hot_drink: true, price: 3)

      expect(drink_1.hot_drink?).to eq(true)
    end

    it 'returns the price of the drink' do
      coffee_shop_1 = CoffeeShop.create!(name: "Starbucks", open_year: 1971, open_after_five: true )

      drink_1 = Drink.create!(coffee_shop_id: coffee_shop_1, name: "Flat White", hot_drink: true, price: 3)

      expect(drink_1.price).to eq(3)
    end
  end
end