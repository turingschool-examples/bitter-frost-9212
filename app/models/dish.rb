class Dish < ApplicationRecord
  belongs_to :chef

  has_many :ingredient_dishes
  has_many :ingredients, through: :ingredient_dishes

  def total_calorie_count
    self.ingredients.sum(:calories)
  end
end
