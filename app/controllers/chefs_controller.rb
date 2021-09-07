class ChefsController < ApplicationController
  def show
    @chef = Chef.find(params[:id])
    @pop_ingredients = Ingredient.popular_ingredients(params[:id])
  end
end
