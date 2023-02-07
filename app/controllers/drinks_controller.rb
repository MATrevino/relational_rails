class DrinksController < ApplicationController
  def index
    if params[:sort] == "hot_drink"
      @drinks = Drink.filter_hot_drinks
    else 
      @drinks = Drink.all
    end
  end

  def show
    @drink = Drink.find(params[:id])
  end

  def edit
    @drink = Drink.find(params[:id])
  end

  def update
    drink = Drink.find(params[:id])
    drink.update(drink_params)
    redirect_to "/drinks/#{drink.id}"
  end

  private
  def drink_params
    params.permit(:name, :price, :hot_drink)
  end
end