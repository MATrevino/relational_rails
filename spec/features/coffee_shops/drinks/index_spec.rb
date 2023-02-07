require 'rails_helper'
RSpec.describe 'Coffee Shop Drinks index' do
  describe "When I visit '/parents/:parent_id/child_table_name' US#5" do
    it "Then I see each Child that is associated with that Parent with each Child's attributes" do
      coffee_shop_1 = CoffeeShop.create!(name: "Starbucks", open_year: 1971, open_after_five: true )
      drink_1 = coffee_shop_1.drinks.create!(coffee_shop_id: coffee_shop_1.id, name: "Flat White", hot_drink: true, price: 3)
      drink_2 = coffee_shop_1.drinks.create!(coffee_shop_id: coffee_shop_1.id, name: "Pumpkin Spice Latte", hot_drink: true, price: 5)
      
      visit "/coffee_shops/#{coffee_shop_1.id}/drinks"

      expect(page).to have_content(drink_1.name)
      expect(page).to have_content(drink_2.name)
      expect(page).to have_content(drink_1.price)
      expect(page).to have_content(drink_1.hot_drink)
    end
  end

  describe "When I visit a parent show page ('/parents/:id')" do
    it "Then I see a link to take me to that parent's `child_table_name` page ('/parents/:id/child_table_name')" do
      coffee_shop_1 = CoffeeShop.create!(name: "Starbucks", open_year: 1971, open_after_five: true )
      drink_1 = Drink.create!(coffee_shop_id: coffee_shop_1.id, name: "Flat White", hot_drink: true, price: 3)
      drink_2 = Drink.create!(coffee_shop_id: coffee_shop_1.id, name: "Pumpkin Spice Latte", hot_drink: true, price: 5)
      
      visit "/coffee_shops/#{coffee_shop_1.id}"

      click_link("Coffee Shop's drinks")

      expect(current_path).to eq("/coffee_shops/#{coffee_shop_1.id}/drinks")
    end
  end
end