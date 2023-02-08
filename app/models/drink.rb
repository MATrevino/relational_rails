class Drink < ApplicationRecord
  belongs_to :coffee_shop
  scope :filter_hot_drinks, -> { where(hot_drink: true) }
  scope :sort_alphabetically, -> { order(name: :asc) }
  # scope :filter_price(amount), -> { where("price > #{amount}") }
  
  # def self.filter_hot_drinks
  #   where(hot_drink: true)
  # end

  def self.filter_price(num)
    where("price > #{num}")
  end
end