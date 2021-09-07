class DishesController < ApplicationController

  def show
    @dish = Dish.find(params[:id])
  end

  def create
    dish = Dish.create(dish_params)
    dish.save
  end

  private

  def dish_params
    params.permit(:name, :description)
  end
end
