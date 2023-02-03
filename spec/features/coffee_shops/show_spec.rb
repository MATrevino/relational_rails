require 'rails_helper'

RSpec.describe "coffee shop show page", type: :feature do 
describe "when I visit /parents/:id US2" do
    it "Then I see the parent with that id including the parent's attributes" do
      coffee_shop_1 = CoffeeShop.create!(name: "Starbucks", open_year: 1971, open_after_five: true )
    
      visit "/coffee_shops/#{coffee_shop_1.id}"
      expect(page).to have_content(coffee_shop_1.name)
      expect(page).to have_content(coffee_shop_1.open_year)
      expect(page).to have_content(coffee_shop_1.open_after_five)
    end
  end
end