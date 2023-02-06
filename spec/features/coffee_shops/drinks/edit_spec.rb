# User Story 14, Child Update 

# As a visitor
# When I visit a Child Show page
# Then I see a link to update that Child "Update Child"
# When I click the link
# I am taken to '/child_table_name/:id/edit' where I see a form to edit the child's attributes:

# When I click the button to submit the form "Update Child"
# Then a `PATCH` request is sent to '/child_table_name/:id',
# the child's data is updated,
# and I am redirected to the Child Show page where I see the Child's updated information
require 'rails_helper'

RSpec.describe 'coffee shop drink update US#14' do
  describe 'Then I see a link to update that Child "Update Child"' do
    it 'links to the edit page' do
      coffee_shop_1 = CoffeeShop.create!(name: "Hooked on Colfax")
      drink_1 = coffee_shop_1.drinks.create!(coffee_shop_id: coffee_shop_1.id, name: "Flat White", hot_drink: true, price: 3)

      visit "/drinks/#{drink_1.id}"

      click_button "Edit #{drink_1.name}"
      expect(current_path).to eq("/drinks/#{drink_1.id}/edit")
    end

    it 'can edit the drink' do
      coffee_shop_1 = CoffeeShop.create!(name: "Hooked on Colfax")
      drink_1 = coffee_shop_1.drinks.create!(coffee_shop_id: coffee_shop_1.id, name: "Fax White", hot_drink: true, price: 3)

      visit "/drinks/#{drink_1.id}"
      expect(page).to have_content("Fax White")
      click_button "Edit Fax White"

      fill_in('name', with: "Flat White")
      fill_in('price', with: 3)
      find('#hot_drink').click

      click_button "Update Drink"

      expect(current_path).to eq("/drinks/#{drink_1.id}")
      expect(page).to have_content("Flat White")

    end
  end
end