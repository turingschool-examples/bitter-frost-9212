class IngredientsController < ApplicationController

  def index
    @ingredients = Ingredient.all
  end

  def show
    @ingredient = Ingredient.find(params[:id])
  end


  private

  def ingredient_params
    params.permit(:name, :calories)
  end
  
end
