require 'rails_helper'

RSpec.describe CoffeeShop, type: :model do
  it {should have_many :drinks}

  describe '#sort' do
    it 'sorts parents by most recently created at' do
      coffee_shop_1 = CoffeeShop.create!(name: "Starbucks", open_year: 1971, open_after_five: true, created_at: Time.now - 1.hour )
      coffee_shop_2 = CoffeeShop.create!(name: "Pablo's Coffee", open_year: 2001, open_after_five: false, created_at: Time.now - 2.hour )
      coffee_shop_3 = CoffeeShop.create!(name: "Metropolis", open_year: 2002, open_after_five: false)
      
      expect(CoffeeShop.sort).to eq([coffee_shop_3, coffee_shop_1, coffee_shop_2])
    end
  end
end