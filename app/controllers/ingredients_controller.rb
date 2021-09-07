class IngredientsController < ApplicationController
  def show
    @ingredients = Ingredients.find(params[:id])
  end
end
