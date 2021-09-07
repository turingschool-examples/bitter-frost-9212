class ChefController < ApplicationController

  def show
    @chef = Chef.find(params[:id])
  end

  def index
    @chef = Chef.find(params[:chef_id])

    @ingredients = @chef.find_ingredients
  end
end
