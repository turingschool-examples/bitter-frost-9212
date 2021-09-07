class ChefIngredientsController < ApplicationController
  def index
    @chef = Chef.find(params[:id])
    @chef_ingredients = @chef.ingredients_index
  end
end
