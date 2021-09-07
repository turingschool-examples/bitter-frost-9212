class ChefIngredientsController < ApplicationController

  def index
    @chef = Chef.find(params[:id])
    @ingredients = Ingredient.for_chef(@chef.id)
  end

end
