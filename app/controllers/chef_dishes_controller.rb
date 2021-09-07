class ChefDishesController < ApplicationController
  def index
  end

  def show
    @chef = Chef.find(params[:id])
    @dishes = @chef.dishes.all
  end

  def new
  end

  def create
    @chef = Chef.find(params([:id])
    @dish = @chef.dishes.create!(dish_params)

    redirect_to "/chefs/#{chef.id}/dishes"
  end

  def edit
    @chef = Chef.find(params[:id])
  end

  def update
    chef = Chef.find(params[:id])
    chef.update(chef_params)

    chef.save

    redirect_to "/chefs/#{chef.id}"
  end

  def destroy
    Chef.destroy(params[:id])

    redirect_to "/chefs"
  end


  private

  def dish_params
    params.permit(:name, :description)
  end

end
