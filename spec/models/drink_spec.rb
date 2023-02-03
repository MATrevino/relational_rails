require 'rails_helper'

describe Drink, type: :model do
  it {should belong_to :coffee_shop}
end