require 'rails_helper'

RSpec.describe CoffeeShop, type: :model do
  describe 'table attributes' do
    it 'returns name' do
      coffee_shop_1 = CoffeeShop.create!(name: "Starbucks", open_year: 1971, open_after_five: true )

      expect(coffee_shop_1.name).to eq("Starbucks")
    end

    it 'returns the year it opened' do
      coffee_shop_1 = CoffeeShop.create!(name: "Starbucks", open_year: 1971, open_after_five: true )
      expect(coffee_shop_1.open_year).to eq(1971)
    end

    it 'return true if shop is open after five' do
      coffee_shop_1 = CoffeeShop.create!(name: "Starbucks", open_year: 1971, open_after_five: true )
      expect(coffee_shop_1.open_after_five?).to be(true)

      coffee_shop_2 = CoffeeShop.create!(name: "Pablo's Coffee", open_year: 2001, open_after_five: false)
      expect(coffee_shop_2.open_after_five?).to eq(false)
    end
  end
end