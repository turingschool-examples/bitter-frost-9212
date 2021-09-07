class Dish < ApplicationRecord
  belongs_to :chef
  has_many :ingredients_dishes
  has_many :ingredients, through: :ingredients_dishes
end
