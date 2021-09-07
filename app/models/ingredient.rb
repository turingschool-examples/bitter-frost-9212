class Ingredient < ApplicationRecord
  validates :name, :calories, presence: true

  has_many :dishes
  has_many :dishes, through: :dish_ingredients
end
