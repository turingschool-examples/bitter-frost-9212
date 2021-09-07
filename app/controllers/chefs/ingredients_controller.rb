class Chefs::IngredientsController < ApplicationController
  def index
    @chefs = Chef.all
    @dish = Dish.find(params[:id])
    @ingredients = @dish.ingredients.all
  end
end
