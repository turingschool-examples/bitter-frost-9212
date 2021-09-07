class ChefsController < ApplicationController
  def show
    @chef = Chef.find(params[:id])
    @most_popular = @chef.most_popular_ingredients
  end
end
