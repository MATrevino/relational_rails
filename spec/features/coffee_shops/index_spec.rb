require 'rails_helper'

RSpec.describe "coffee shop index page", type: :feature do 
  describe "as a visitor" do
    describe "When I visit '/parents'US1" do
      it "Then I see the name of each parent record in the system" do
        coffee_shop_1 = CoffeeShop.create!(name: "Starbucks", open_year: 1971, open_after_five: true )

        visit '/coffee_shops'
        expect(page).to have_content(coffee_shop_1.name)
      end
    
      it "I see that records are ordered by most recently created first US5" do
      coffee_shop_1 = CoffeeShop.create!(name: "Starbucks", open_year: 1971, open_after_five: true, created_at: Time.now - 1.hour )
      coffee_shop_2 = CoffeeShop.create!(name: "Pablo's Coffee", open_year: 2001, open_after_five: false, created_at: Time.now - 2.hour )
      coffee_shop_3 = CoffeeShop.create!(name: "Metropolis", open_year: 2002, open_after_five: false)
      
      visit '/coffee_shops'
       
      expect(coffee_shop_3.name).to appear_before(coffee_shop_1.name)
      expect(coffee_shop_1.name).to appear_before(coffee_shop_2.name)
     end
    end

    describe "as a visitor" do
      describe "When I visit any page on the site" do
        it "Then I see a link at the top of the page that takes me to the Parent Index US9" do
          coffee_shop_1 = CoffeeShop.create!(name: "Starbucks", open_year: 1971, open_after_five: true, created_at: Time.now - 1.hour )
          coffee_shop_2 = CoffeeShop.create!(name: "Pablo's Coffee", open_year: 2001, open_after_five: false, created_at: Time.now - 2.hour )
          coffee_shop_3 = CoffeeShop.create!(name: "Metropolis", open_year: 2002, open_after_five: false)
      
          visit "/drinks"

          click_link("List of all Coffee Shops")

          expect(current_path).to eq("/coffee_shops")
        end
      end
    end
    describe 'User Story 17, Parent Update From Parent Index Page' do
      describe 'When I visit the parent index page' do
        describe " When I click the link" do
         it  "should be taken to that parent's edit page where I can update its info" do
            coffee_shop = CoffeeShop.create!(name: "Hooked on Colfax")
            visit "/coffee_shops"
      
            click_button "Edit #{coffee_shop.name}"
      
            expect(current_path).to eq("/coffee_shops/#{coffee_shop.id}/edit")
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
        
            expect(current_path).to eq("/coffee_shops/#{coffee_shop.id}")
            expect(page).to have_content('Hooked on Colfax')
         end
        end
      end
    end
    describe 'user story 22' do
      describe 'when I visit parent index page, next to each parent is a link to delete parent' do
        it 'clicks link and returns to parent index page' do
          coffee_shop_1 = CoffeeShop.create!(name: "Starbucks", open_year: 1971, open_after_five: true, created_at: Time.now - 1.hour )
          

          visit "/coffee_shops"
          click_button "Delete"
          
          expect(current_path).to eq("/coffee_shops")
          expect(page).to_not have_content("Starbucks")
        end
      end
    end
  end
end