class Chef < ApplicationRecord
  has_many :dishes

  def all_ingredients
    ingredients =
    dishes.map do |dish|
      dish.ingredients
    end
    ingredients.flatten.uniq
  end

  def most_popular_ingredients
    result =
    all_ingredients.sort_by do |ingredient|
      ingredient.dishes.length
    end
    result.last(3)
  end
end
