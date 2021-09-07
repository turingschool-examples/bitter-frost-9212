class Dish < ApplicationRecord
  belongs_to :chef

  has_many :ingredient_dishes, dependent: :destroy
  has_many :ingredients, through: :ingredient_dishes

  def total_cal
    ingredients.sum do |ing|
      ing.calories
    end
  end
end
