require 'rails_helper'

RSpec.describe "coffee shop show page", type: :feature do 
  describe "when I visit /parents/:id US2" do
    it "Then I see the parent with that id including the parent's attributes" do
      coffee_shop_1 = CoffeeShop.create!(name: "Starbucks", open_year: 1971, open_after_five: true )
      coffee_shop_2 = CoffeeShop.create!(name: "Pablo's Coffee", open_year: 2001, open_after_five: false)

      visit "/coffee_shops/#{coffee_shop_1.id}"
      expect(page).to have_content(coffee_shop_1.name)
      expect(page).to have_content(coffee_shop_1.open_year)
      expect(page).to have_content(coffee_shop_1.open_after_five)
      expect(page).to_not have_content(coffee_shop_2.name)
      expect(page).to_not have_content(coffee_shop_2.open_year)
      expect(page).to_not have_content(coffee_shop_2.open_after_five)
    end

    describe '#countdrinks' do
      it 'I see a count of the number of children associated with this parent US7' do
        coffee_shop_1 = CoffeeShop.create!(name: "Starbucks", open_year: 1971, open_after_five: true, created_at: Time.now - 1.hour )
        drink_1 = Drink.create!(coffee_shop_id: coffee_shop_1.id, name: "Flat White", hot_drink: true, price: 3)
        drink_2 = Drink.create!(coffee_shop_id: coffee_shop_1.id, name: "Pumpkin Spice Latte", hot_drink: true, price: 5)
        drink_3 = Drink.create!(coffee_shop_id: coffee_shop_1.id, name: "Cold Brew", hot_drink: false, price: 4)
        
        visit "/coffee_shops/#{coffee_shop_1.id}"
        expect(page).to have_content(coffee_shop_1.name)
        expect(page).to have_content(coffee_shop_1.countdrinks)
        expect(coffee_shop_1.countdrinks).to eq(3)
      end
    end
  end
end