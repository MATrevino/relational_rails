require 'rails_helper'

RSpec.describe "coffee shop index page", type: :feature do 
  describe "as a visitor" do
    describe "When I visit '/parents'US1" do
      it "Then I see the name of each parent record in the system" do
        coffee_shop_1 = CoffeeShop.create!(name: "Starbucks", open_year: 1971, open_after_five: true )

        visit '/coffee_shops'
        expect(page).to have_content(coffee_shop_1.name)
      end
    end

    describe 'When I visit the parent index US6' do
      it "I see that records are ordered by most recently created first" do
      coffee_shop_1 = CoffeeShop.create!(name: "Starbucks", open_year: 1971, open_after_five: true, created_at: Time.now - 1.hour )
      coffee_shop_2 = CoffeeShop.create!(name: "Pablo's Coffee", open_year: 2001, open_after_five: false, created_at: Time.now - 2.hour )
      coffee_shop_3 = CoffeeShop.create!(name: "Metropolis", open_year: 2002, open_after_five: false)
      
      visit '/coffee_shops'
      save_and_open_page 
    
      expect(coffee_shop_3.name).to appear_before(coffee_shop_1.name)
      expect(coffee_shop_1.name).to appear_before(coffee_shop_2.name)
     end
    end
  end
end