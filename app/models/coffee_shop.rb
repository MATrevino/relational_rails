class CoffeeShop < ApplicationRecord
  has_many :drinks, dependent: :destroy

  def self.sort
    order(created_at: :DESC)
  end
end