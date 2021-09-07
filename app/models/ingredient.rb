class Ingredient < ApplicationRecord
  has_many :dishes, through: :dish_ingredients
  has_many :dish_ingredients
end
