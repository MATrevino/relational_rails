require 'rails_helper'

RSpec.describe 'user story #20' do
  describe 'As a visitor to the child show page' do
    describe "then I see the link to delete the child and when I click the link" do
      it "Then a 'DELETE' request is sent to '/child_table_name/:id', the child is deleted, and I am redirected to the child index page" do
        coffee_shop_1 = CoffeeShop.create!(name: "Starbucks", open_year: 1971, open_after_five: true)
        drink_1 = coffee_shop_1.drinks.create!(coffee_shop_id: coffee_shop_1.id, name: "Flat White", hot_drink: true, price: 3)

        visit "/drinks/#{drink_1.id}"
        click_button "Delete"

        expect(current_path).to eq("/drinks")
        expect(page).to_not have_content("Flat White")
      end
    end
  end
end