class CoffeeShop < ApplicationRecord
  has_many :drinks, dependent: :destroy
end