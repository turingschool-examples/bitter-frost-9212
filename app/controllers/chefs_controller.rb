class ChefsController < ApplicationController

  def index
    @chefs = Chef.all
  end

  def show
    @chef = Chef.find(params[:chef_id])
    @dishes = @chef.dishes.all
    # @ingredients = @chef.dishes.ingredients.all
  end

  def new
  end

  def create
    chef = Chef.create(chef_params)

    redirect_to "/chefs"
  end

  def edit
    @chef = Chef.find(params[:chef_id])
  end

  def update
    chef = Chef.find(params[:chef_id])
    chef.update(chef_params)

    chef.save

    redirect_to "/chefs/#{chef.id}"
  end

  def destroy
    Chef.destroy(params[:chef_id])

    redirect_to "/chefs"
  end


  private

  def chef_params
    params.permit(:name)
  end
end
