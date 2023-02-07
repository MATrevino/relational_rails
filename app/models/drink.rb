class Drink < ApplicationRecord
  belongs_to :coffee_shop
  scope :filter_hot_drinks, -> { where(hot_drink: true) }
  scope :sort_alphabetically, -> { order(name: :asc) }
  
  # def self.filter_hot_drinks
  #   where(hot_drink: true)
  # end
end