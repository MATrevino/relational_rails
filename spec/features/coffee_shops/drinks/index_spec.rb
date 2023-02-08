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
  describe "User Story 16, Sort Parent's Children in Alphabetical Order by name " do
    describe "When I visit the Parent's children Index Page" do
      it "Then I see a link to sort children in alphabetical order" do
        coffee_shop_1 = CoffeeShop.create!(name: "Starbucks", open_year: 1971, open_after_five: true )
        drink_1 = Drink.create!(coffee_shop_id: coffee_shop_1.id, name: "Flat White", hot_drink: true, price: 3)
        drink_2 = Drink.create!(coffee_shop_id: coffee_shop_1.id, name: "Pumpkin Spice Latte", hot_drink: true, price: 5)
      
        visit "/coffee_shops/#{coffee_shop_1.id}/drinks"

        click_link("sort alphabetically")

        expect(current_path).to eq("/coffee_shops/#{coffee_shop_1.id}/drinks")
        expect(drink_1.name).to appear_before(drink_2.name)
      end
    end
  end
  describe "when I visit a parent's children index page US#21" do
    describe "I see a form that allows me to input a number value" do
      describe "When I input a number value and click the submit button that reads 'Only return records with more than `number` of `column_name`'" do
        it "Then I am brought back to the current index page with only the records that meet that threshold shown." do
          coffee_shop_1 = CoffeeShop.create!(name: "Starbucks", open_year: 1971, open_after_five: true )
          drink_1 = Drink.create!(coffee_shop_id: coffee_shop_1.id, name: "Flat White", hot_drink: true, price: 3)
          drink_2 = Drink.create!(coffee_shop_id: coffee_shop_1.id, name: "Pumpkin Spice Latte", hot_drink: true, price: 5)
          
          visit "/coffee_shops/#{coffee_shop_1.id}/drinks"
          expect(page).to have_content("Flat White")
          expect(page).to have_content("Pumpkin Spice Latte")

          click_button("Only return drinks costing more than")

          fill_in("price", with: 4)
          click_button("Only return drinks costing more than")
          
          expect(current_path).to eq("/coffee_shops/#{coffee_shop_1.id}/drinks")
          expect(page).to have_content("Pumpkin Spice Latte")
          expect(page).to_not have_content("Flat White")
        end
      end
    end
  end
end