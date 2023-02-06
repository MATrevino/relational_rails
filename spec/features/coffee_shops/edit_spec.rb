require 'rails_helper'

RSpec.describe 'coffee shop update US#12' do
  describe "as a visitor to the coffee shop show page" do
    it 'links to the edit page' do 
      coffee_shop = CoffeeShop.create!(name: "Hooked on Colfax")
      visit "/coffee_shops"

      click_button "Edit #{coffee_shop.name}"

      expect(current_path).to eq("/coffee_shops/#{coffee_shop.id}/edit")
    end
  end

  it 'can edit the coffee shop' do
    coffee_shop = CoffeeShop.create!(name: "Hooked on Colfa")

    visit "/coffee_shops"

    expect(page).to have_content("Hooked on Colfa")

    click_button "Edit #{coffee_shop.name}"

    fill_in('name', with: 'Hooked on Colfax')
    fill_in('open_year', with: "2005")
    find("#open_after_five").click 

    click_button 'Update Coffee Shop'

    expect(current_path).to eq("/coffee_shops")
    expect(page).to have_content('Hooked on Colfax')
  end
end