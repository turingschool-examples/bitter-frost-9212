class Chef < ApplicationRecord
  has_many :dishes

  # LMAO NO PLZ
  def ingredients
    i = []
    dishes.each do |dish|
      dish.ingredients.each do |ingredient|
        i << ingredient
      end
    end
    i.uniq
  end
end
