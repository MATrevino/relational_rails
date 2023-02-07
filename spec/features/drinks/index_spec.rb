require 'rails_helper'

RSpec.describe Drink do
  describe 'as a visitor' do
    describe "when I visit '/child_table_name' US3" do
      it "Then I see each Child in the system including the Child's attributes" do
      
        coffee_shop_1 = CoffeeShop.create!(name: "Starbucks", open_year: 1971, open_after_five: true )
        drink_1 = Drink.create!(coffee_shop_id: coffee_shop_1.id, name: "Flat White", hot_drink: true, price: 3)
        drink_2 = Drink.create!(coffee_shop_id: coffee_shop_1.id, name: "Pumpkin Spice Latte", hot_drink: true, price: 5)

        visit '/drinks'
        expect(page).to have_content(drink_1.name)
        expect(page).to have_content(drink_1.hot_drink)
        expect(page).to have_content(drink_1.price)
        expect(page).to have_content(drink_2.name)
        expect(page).to have_content(drink_2.hot_drink)
        expect(page).to have_content(drink_2.price)

      end
    end
    describe "When I visit '/child_table_name/:id' US4" do
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

    describe "When I visit any page on site US8" do
      it "# Then I see a link at the top of the page that takes me to the Child Index" do
        coffee_shop_1 = CoffeeShop.create!(name: "Starbucks", open_year: 1971, open_after_five: true )
        drink_1 = Drink.create!(coffee_shop_id: coffee_shop_1.id, name: "Flat White", hot_drink: true, price: 3)
        drink_2 = Drink.create!(coffee_shop_id: coffee_shop_1.id, name: "Pumpkin Spice Latte", hot_drink: true, price: 5)

        visit "/coffee_shops"
        #visit any page ^
        click_on("All Drinks")

        expect(current_path).to eq("/drinks")
      end
    end

    describe 'when I visit the child index, user story #15' do
      it "Then I only see records where the boolean column is `true`" do
        coffee_shop_1 = CoffeeShop.create!(name: "Starbucks", open_year: 1971, open_after_five: true )
        drink_1 = Drink.create!(coffee_shop_id: coffee_shop_1.id, name: "Flat White", hot_drink: true, price: 3)
        drink_3 = Drink.create!(coffee_shop_id: coffee_shop_1.id, name: "Cold Brew", hot_drink: false, price: 4)
        visit "/drinks"

        expect(page).to have_content("Cold Brew")
        expect(page).to have_content("Flat White")

        click_link("Filter out cold drinks")

        expect(current_path).to eq("/drinks")
        expect(page).to have_content("Flat White")
        expect(page).not_to have_content("Cold Brew")
      end
    end
    describe "user story #23: child delete from childs index page" do
      describe "when I visit the child table index page, each child has a delete link" do
        describe "when I click the link" do
          it "should be taken to the `child_table_name` index page where I no longer see that child" do
            coffee_shop_1 = CoffeeShop.create!(name: "Starbucks", open_year: 1971, open_after_five: true )
            drink_1 = Drink.create!(coffee_shop_id: coffee_shop_1.id, name: "Flat White", hot_drink: true, price: 3)
            drink_3 = Drink.create!(coffee_shop_id: coffee_shop_1.id, name: "Cold Brew", hot_drink: false, price: 4)
            
            visit "/drinks"

            click_button "Delete #{drink_1.name}"
            expect(current_path).to eq("/drinks")
            expect(page).to have_content("Cold Brew")
            expect(page).to_not have_content("Flat White")
          end
        end
      end
    end
  end
end