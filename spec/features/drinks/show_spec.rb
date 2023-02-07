require 'rails_helper'

RSpec.describe 'coffee shop drink update US#14' do
  describe 'visiting Child Show page, Then I see a link to update that Child "Update Child"' do
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