class Dish < ApplicationRecord
  belongs_to :chef
  has_many :dishes_ingredients
  has_many :ingredients, through: :dishes_ingredients

  def total_calories
    self.ingredients
  end
end
