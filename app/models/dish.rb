class Dish < ApplicationRecord
  belongs_to :chef
  has_many :dish_ingredients
  has_many :ingredients, through: :dish_ingredients

  def calories
    # require "pry"; binding.pry
    if ingredients.count > 0
      ingredients.sum(:calories)
    else
      0
    end
  end
end
