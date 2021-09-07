class Ingredient < ApplicationRecord
  has_many :dish_ingredients
  has_many :dishes, through: :dish_ingredients

  def self.ingredients_by_chef(chef)
    # require "pry"; binding.pry
    arr = []
    chef.dishes.each do |dish|
      arr << dish.ingredients
    end
    arr.flatten.uniq
  end
end
