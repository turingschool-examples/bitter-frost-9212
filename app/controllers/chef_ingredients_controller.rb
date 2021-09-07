class ChefIngredientsController < ApplicationController

  def index
    @chef = Chef.find(params[:id])
    @ingredients = @chef.uniq_ingred
  end
end
