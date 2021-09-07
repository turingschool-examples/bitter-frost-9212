class ChefIngredientsController < ApplicationController
  def index
    @ingredients = chef.ingredients
  end
end