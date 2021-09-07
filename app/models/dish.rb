class Dish < ApplicationRecord
  belongs_to :chef
  has_many :dish_ingredients
  has_many :ingredients, through: :dish_ingredients

  def total_calories
    ingredients.sum(:calories)
  end

  def unique_ingredients
    ingredients.select(:name).distinct
  end
end
