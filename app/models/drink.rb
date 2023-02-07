class Drink < ApplicationRecord
  belongs_to :coffee_shop
  scope :filter_hot_drinks, -> { where(hot_drink: true) }
  
  def self.filter_hot_drinks
    where(hot_drink: true)
  end
end