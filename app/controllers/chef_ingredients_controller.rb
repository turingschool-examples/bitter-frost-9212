class ChefIngredientsController < ApplicationController

  def index
    @chef = Chef.find(params[:chef_id])
    @unique_ingredients = @chef.unique_list_of_ingredients
  end

end
