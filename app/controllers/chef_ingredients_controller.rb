class ChefIngredientsController < ApplicationController

  def index
    @chef = Chef.find(params[:id])
    @ingredients = @chef.ingredients.all
  end
  
end
