class DishesController < ApplicationController
  def show
    @dish = Dish.find(params[:id])
    @ingredients_list = @dish.ingredients_list
  end
end
