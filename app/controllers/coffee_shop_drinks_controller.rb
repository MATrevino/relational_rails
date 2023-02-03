class CoffeeShopDrinksController < ApplicationController
  def index
    coffee_shop = CoffeeShop.find(params[:coffee_shop_id])
    @drinks = coffee_shop.drinks
  end
end