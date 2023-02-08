require 'rails_helper'

describe Drink, type: :model do
  it {should belong_to :coffee_shop}

  it 'filters cold drinks out' do
    coffee_shop_1 = CoffeeShop.create!(name: "Starbucks", open_year: 1971, open_after_five: true )
      drink_1 = Drink.create!(coffee_shop_id: coffee_shop_1.id, name: "Flat White", hot_drink: true, price: 3)
      drink_3 = Drink.create!(coffee_shop_id: coffee_shop_1.id, name: "Cold Brew", hot_drink: false, price: 4)
        
    expect(Drink.filter_hot_drinks).to eq([drink_1])
  end

  it 'filters price' do
    coffee_shop_1 = CoffeeShop.create!(name: "Starbucks", open_year: 1971, open_after_five: true )
    drink_1 = Drink.create!(coffee_shop_id: coffee_shop_1.id, name: "Flat White", hot_drink: true, price: 3)
    drink_2 = Drink.create!(coffee_shop_id: coffee_shop_1.id, name: "Pumpkin Spice Latte", hot_drink: true, price: 5)
    
    expect(Drink.filter_price(4)).to eq([drink_2])
  end
end