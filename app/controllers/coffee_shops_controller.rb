class CoffeeShopsController < ApplicationController
  def index
    @coffee_shops = CoffeeShop.sort
  end

  def show
    @coffee_shop = CoffeeShop.find(params[:id])
  end

  def new
  end

  def create
   coffee_shop = CoffeeShop.create!(coffee_shop_params)
   coffee_shop.save
   redirect_to "/coffee_shops"
  end
  
  def edit
    @coffee_shop = CoffeeShop.find(params[:id])
  end
  
  def update
    coffee_shop = CoffeeShop.find(params[:id])
    coffee_shop.update!(coffee_shop_params)
    redirect_to '/coffee_shops'
  end

  def destroy
    coffee_shop = CoffeeShop.find(params[:id])
    coffee_shop.destroy
    redirect_to "/coffee_shops"
  end

  private
  #adds security
  def coffee_shop_params
    params.permit(:name, :open_year, :open_after_five)
  end
end