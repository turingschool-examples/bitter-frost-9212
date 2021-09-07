class Dish < ApplicationRecord
  belongs_to :chef
  has_many :dish_ingredients
  has_many :ingredients, through: :dish_ingredients

  def calories_per_dish
    ingredients.sum { |ingred| ingred.calories }
  end 
end
