class DishesController < ApplicationController
  def new

  end

  def create
    @dish = Dish.create(dish_params)
    redirect_to "/dishes/#{@dish.id}"
  end

  def show
    @dish = Dish.find(params[:id])
  end

  def dish_params
    params.permit(:name, :description)
  end
end
