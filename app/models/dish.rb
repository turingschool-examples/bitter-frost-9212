class Dish < ApplicationRecord
  belongs_to :chef
  has_many   :dish_ingredients
  has_many   :ingredients, through: :dish_ingredients

  def ingredients_list
    list = ""
    ingredients.each do |ingredient|
      list += "#{ingredient.name}, "
    end
    list.chop.chop
  end
end
