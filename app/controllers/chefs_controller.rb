class ChefsController < ApplicationController

  def show
    @chef = Chef.find(params[:id])
    @ingredients = Ingredient.most_pop(@chef.id)
  end
end
