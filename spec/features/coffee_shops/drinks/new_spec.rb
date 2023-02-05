# As a visitor
# When I visit a Parent Children Index page
# Then I see a link to add a new adoptable child for that parent "Create Child"
# When I click the link
# I am taken to '/parents/:parent_id/child_table_name/new' where I see a form to add a new adoptable child

# When I fill in the form with the child's attributes:
# And I click the button "Create Child"
# Then a `POST` request is sent to '/parents/:parent_id/child_table_name',
# a new child object/row is created for that parent,
# and I am redirected to the Parent Childs Index page where I can see the new child listed

require 'rails_helper'

RSpec.describe 'as a visitor' do
  describe 'a parent children index page US#13 creation' do
    it "Then I see a link to add a new adoptable child for that parent 'Create Child'" do
      coffee_shop_1 = CoffeeShop.create!(name: "Starbucks", open_year: 1971, open_after_five: true )

      visit "/coffee_shops/#{coffee_shop_1.id}/drinks"

      click_link('New Drink')

      expect(current_path).to eq("/coffee_shops/#{coffee_shop_1.id}/drinks/new")
    end

    it 'can create a new child' do
      coffee_shop_1 = CoffeeShop.create!(name: "Starbucks", open_year: 1971, open_after_five: true )
      drink_1 = Drink.create!(coffee_shop_id: coffee_shop_1.id, name: "Flat White", hot_drink: true, price: 3)

      visit "/coffee_shops/#{coffee_shop_1.id}/drinks/new"

      fill_in('Name', with: 'Caramel Macchiato')
      click_button("Create Drink")
      
      new_drink_id = Drink.last.id
      expect(current_path).to eq("/coffee_shops/#{coffee_shop_1.id}/drinks")
      expect(page).to have_content("Caramel Macchiato")
    end
  end
end