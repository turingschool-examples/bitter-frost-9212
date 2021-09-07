class ChefsController < ApplicationController

  def create
    chef = Chef.create(chef_params)
    chef.save
  end

  def index
    @chef = Chef.find(params[:chef_id])
    @chef.dishes
  end

  def show
    @chef = Chef.find(params[:id])
  end

  private

  def chef_params
    params.permit(:name)
  end

  def ingredients
    dish.ingredients
  end
end
