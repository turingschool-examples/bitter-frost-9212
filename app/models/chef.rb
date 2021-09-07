class Chef < ApplicationRecord
  has_many :dishes

  def all_ingredients
    ingredients =
    dishes.map do |dish|
      dish.ingredients
    end
    ingredients.flatten.uniq
  end
end
