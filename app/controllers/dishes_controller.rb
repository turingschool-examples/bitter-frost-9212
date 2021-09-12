class DishesController < ApplicationController

  def index
    @dishes = Dish.all
  end

  def show
    # @chef = Chef.find(params[:chef_id])
    @dish = Dish.find(params[:dish_id])
  end

  def new
  end

  def create
    # chef = Chef.find(params[:id])
    dish = Dish.create(dish_params)

    redirect_to "/dishes"
  end

  def edit
    dish = Dish.find(params[:dish_id])
  end

  def update
    dish = Dish.find(params[:dish_id])
    dish.update!(dish_params)

    redirect_to "/dishes/#{dish.id}"
  end

  def destroy
    Dish.destroy(params[:dish_id])

    redirect_to "/dishes"
  end



  private

  def dish_params
    params.permit(:name, :description)
  end

end
