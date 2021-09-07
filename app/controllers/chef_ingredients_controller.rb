class ChefIngredientsController < ApplicationController
  def index
    @chef = Chef.find(params[:chef_id])
    @ingredients = @chef.dishes.flat_map do |dish|
      dish.ingredients
    end
  end
end
