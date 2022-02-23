# frozen_string_literal: true

class DishController < ApplicationController
  def show
    @dish = Dish.find(params[:id])
    @ingredients = @dish.ingredients
    @chef = @dish.chef
  end
end
