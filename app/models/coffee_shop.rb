class CoffeeShop < ApplicationRecord
  has_many :drinks, dependent: :destroy

  def self.sort
    order(created_at: :DESC)
  end

  def countdrinks
    drinks.count
  end

  def new
  end
end