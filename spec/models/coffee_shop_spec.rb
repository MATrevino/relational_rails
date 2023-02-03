require 'rails_helper'

RSpec.describe CoffeeShop, type: :model do
  it {should have_many :drinks}
end