class DishesController < ApplicationController

  def index
    @dishes = Dish.all
  end

  def show
    @chef = Chef.find(params[:id])
    @dish = @chef.dishes.find(params[:id])
  end

end
