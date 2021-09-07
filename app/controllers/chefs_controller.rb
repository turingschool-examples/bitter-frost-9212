class ChefsController < ApplicationController
  def show
    @chef = Chef.find(params[:id])
    @chef_ingredients = Ingredient.popular_ingredients(@chef)
  end
end
