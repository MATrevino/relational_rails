class CoffeeShopDrinksController < ApplicationController
  def index
    @coffee_shop = CoffeeShop.find(params[:coffee_shop_id])
    @drinks = @coffee_shop.drinks
  end

  def new
  end

  def create
    drink = Drink.create(name: params[:name], coffee_shop_id: params[:id])
    redirect_to "/coffee_shops/#{params[:id]}/drinks"
  end

  # private
  # def drink_params
  #   params.permit(:name, :hot_drink, :price, :coffee_shop_id)
  # end
end