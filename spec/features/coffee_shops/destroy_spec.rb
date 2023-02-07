# User Story 19, Parent Delete 

# As a visitor
# When I visit a parent show page
# Then I see a link to delete the parent
# When I click the link "Delete Parent"
# Then a 'DELETE' request is sent to '/parents/:id',
# the parent is deleted, and all child records are deleted
# and I am redirected to the parent index page where I no longer see this parent

require 'rails_helper'

RSpec.describe "Parent delete" do
  describe 'when I visit parent show page, I see a link to delete parent, click the link' do
    xit "Then a 'DELETE' request is sent to '/parents/:id'" do
      coffee_shop = CoffeeShop.create!(name: "Hooked on Colfax")

      visit "/coffee_shops/#{coffee_shop.id}"
      click_button "Delete"
      
      expect(current_path).to eq("/coffee_shops")
      expect(page).to_not have_content("Hooked on Colfax")
    end
  end
end