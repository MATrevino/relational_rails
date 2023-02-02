require 'rails_helper'

RSpec.describe "coffee shop index page", type: :feature do 
  describe "as a visitor" do
    describe "When I visit '/parents'" do
      it "Then I see the name of each parent record in the system" do
        coffee_shop_1 = CoffeeShop.create!(name: "Starbucks", open_year: 1971, open_after_five: true )

        visit '/coffee_shops'
        expect(page).to have_content(coffee_shop_1.name)
      end
    end

    describe "when I visit /parents/:id" do
      it "Then I see the parent with that id including the parent's attributes" do
        coffee_shop_1 = CoffeeShop.create!(name: "Starbucks", open_year: 1971, open_after_five: true )
      
        visit "/coffee_shops/#{coffee_shop_1.id}"
        expect(page).to have_content(coffee_shop_1.name)
        expect(page).to have_content(coffee_shop_1.open_year)
        expect(page).to have_content(coffee_shop_1.open_after_five)


      end

    end
      
  end
end