require 'rails_helper'

RSpec.describe 'the coffee shop creation US11' do
  it 'links to the new page from the coffee shop index' do
    visit '/coffee_shops'

    click_link('New Coffee Shop')
    expect(current_path).to eq('/coffee_shops/new') 
  end

  it 'can create a new coffee shop' do
    visit '/coffee_shops/new'

    fill_in('Name', with: "Hooked on Colfax")
    fill_in('open_year', with: "2005")
    find("#open_after_five").click

    click_button('Create Coffee Shop')

    # new_coffee_shop_id = CoffeeShop.last.id
    expect(current_path).to eq("/coffee_shops")
    expect(page).to have_content("Hooked on Colfax")
  end
end