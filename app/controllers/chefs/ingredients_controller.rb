class Chefs::IngredientsController < ApplicationController
  def index
    @chefs = Chef.all
    @dish = Dish.find(params[:id])
    @ingredients = @dish.ingredients.order_name
  end
end
