class Dish < ApplicationRecord
  belongs_to :chef
  has_many :dish_ingredients
  has_many :ingredients, through: :dish_ingredients

  def chef_name
    chef.name
  end

  def calories
    ingredients.sum(:calories)
  end
end
