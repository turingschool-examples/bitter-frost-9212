class Chef < ApplicationRecord
  has_many :dishes

  def all_ing
    dishes.flat_map do |dish|
      dish.ingredients
    end.uniq
  end

  def popular_ing

  end
end
