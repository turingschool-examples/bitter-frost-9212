class DishController < ApplicationController

  def show
    @dish = Dish.find(params[:id])
    @ingredients = @dish.ingredients
    @chef_name = @dish.chef
  end
end
