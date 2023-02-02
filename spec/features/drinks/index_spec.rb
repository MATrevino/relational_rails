require 'rails_helper'

RSpec.describe Drink do
  describe 'as a visitor' do
    describe "when I visit '/child_table_name'" do
      it "Then I see each Child in the system including the Child's attributes" do
      
        coffee_shop_1 = CoffeeShop.create!(name: "Starbucks", open_year: 1971, open_after_five: true )
        drink_1 = Drink.create!(coffee_shop_id: coffee_shop_1.id, name: "Flat White", hot_drink: true, price: 3)
        visit '/drinks'
        expect(page).to have_content(drink_1.name)
        expect(page).to have_content(drink_1.hot_drink)
        expect(page).to have_content(drink_1.price)
      end
    end
    describe "When I visit '/child_table_name/:id'" do
      it "# Then I see the child with that id including the child's attributes" do
      coffee_shop_1 = CoffeeShop.create!(name: "Starbucks", open_year: 1971, open_after_five: true )
      drink_1 = Drink.create!(coffee_shop_id: coffee_shop_1.id, name: "Flat White", hot_drink: true, price: 3)
      drink_2 = Drink.create!(coffee_shop_id: coffee_shop_1.id, name: "Pumpkin Spice Latte", hot_drink: true, price: 5)

      visit "/drinks/#{drink_1.id}"
      expect(page).to have_content(drink_1.name)
      expect(page).to have_content(drink_1.price)
      expect(page).not_to have_content(drink_2.name)
      end
    end
  end
end
