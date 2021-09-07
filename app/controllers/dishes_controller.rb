class DishesController < ApplicationController

  def show
    @dish = Dish.find(params[:id])
    @ingredients = @dish.ingredients
    @total_calories = @dish.calorie_count
  end
end
