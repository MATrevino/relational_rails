class CoffeeShopsController < ApplicationController
  def index
    @coffee_shops = CoffeeShop.sort
  end

  def show
    @coffee_shop = CoffeeShop.find(params[:id])
  end
end