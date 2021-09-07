class Chef < ApplicationRecord
  has_many :dishes

  def ingredients_index
    ingredients = dishes.flat_map do |dish|
      dish.ingredients.map do |ingred|
        ingred.name
      end
    end.uniq!
  end
end
