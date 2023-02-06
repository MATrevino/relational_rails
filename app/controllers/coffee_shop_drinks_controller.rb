class CoffeeShopDrinksController < ApplicationController
  def index
    @coffee_shop = CoffeeShop.find(params[:coffee_shop_id])
    @drinks = @coffee_shop.drinks
  end

  def new
    @coffee_shop = CoffeeShop.find(params[:id])
  end

  def create
    coffee_shop = CoffeeShop.find(params[:coffee_shop_id])
    drink = coffee_shop.drinks.create!(drink_params)
    redirect_to "/coffee_shops/#{coffee_shop.id}/drinks"
  end

  private
  def drink_params
    params.permit(:name, :price, :hot_drink)
  end
end