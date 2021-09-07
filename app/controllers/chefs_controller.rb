class ChefsController < ApplicationController
  def show
    @chef = Chef.find(params[:chef_id])
    require 'pry'; binding.pry
  end
end