require 'rails_helper'

RSpec.describe 'coffee shop update US#12' do
  it 'links to the edit page' do 
    coffee_shop = CoffeeShop.create!(name: "Hooked on Colfax")
    visit "/coffee_shops"

    click_button "Edit #{coffee_shop.name}"

    expect(current_path).to eq("/coffee_shops/#{coffee_shop.id}/edit")
  end

  it 'can edit the coffee shop' do
    coffee_shop = CoffeeShop.create!(name: "Hooked on Colfa")

    visit "/coffee_shops"

    expect(page).to have_content("Hooked on Colfa")

    click_button 'Edit Hooked on Colfa'

    fill_in 'name', with: 'Hooked on Colfax'
    click_button 'Update Coffee Shop'

    expect(current_path).to eq("/coffee_shops")
    expect(page).to have_content('Hooked on Colfax')
  end
end