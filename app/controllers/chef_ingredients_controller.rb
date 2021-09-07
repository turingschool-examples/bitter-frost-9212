class ChefIngredientsController < ApplicationController

  def index
    chef = Chef.find(params[:chef_id])
    @ingredients = Ingredient.ingredients_by_chef(chef)
  end

end
