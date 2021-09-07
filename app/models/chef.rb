class Chef < ApplicationRecord
  has_many :dishes

  def ingredients_index
    ingredients = dishes.flat_map do |dish|
      dish.ingredients.map do |ingred|
        ingred.name
      end
    end.uniq!
  end

  def popular_ingredients
    all_ingredients = dishes.flat_map do |dish|
      dish.ingredients.map do |ingred|
        ingred.name
      end
    end

    all_ingredients_count = Hash.new(0)
    all_ingredients.each do |ingred|
      all_ingredients_count[ingred] += 1
    end

    (all_ingredients_count.sort_by { |ingred,count| count }[-3..-1]).map do |keys,values|
      keys
    end
  end
end
