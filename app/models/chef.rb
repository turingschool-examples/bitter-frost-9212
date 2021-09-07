class Chef < ApplicationRecord
  has_many :dishes

  def all_ing
    dishes.flat_map do |dish|
      dish.ingredients
    end
  end

  def all_ing_uniq
    all_ing.uniq
  end

  def popular_ing
    ordered_ing = all_ing_uniq.sort_by do |ing|
      all_ing.count(ing)
    end.reverse
    ordered_ing.take(3)
  end
end
