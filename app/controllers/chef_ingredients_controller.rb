class ChefIngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.ingredients_by_chef(params[:id])
  end
end
