class ChefsController < ApplicationController

  def index
    @chefs = Chef.all
  end

  def show
    @chef = Chef.find(params[:id])
    @dishes = @chef.dishes.all
    @ingredients = @chef.ingredients.all
  end

  def new
  end

  def create
    chef = Chef.create(chef_params)

    redirect_to "/chefs"
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

  def chef_params
    params.permit(:name)
  end
end
