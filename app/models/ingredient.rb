class Ingredient < ApplicationRecord
  has_many :ingredient_dishes, dependent: :destroy
  has_many :dishes, through: :ingredient_dishes
end
