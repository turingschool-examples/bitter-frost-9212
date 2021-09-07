class Chef < ApplicationRecord
  has_many :dishes

  # def find_ingredients
  #   dishes.joins(:ingredients).where('dish.id = ?', self.id)
  # end

  def find_ingredients
    total = []
    dishes.each do |dish|
      dish.ingredients.each do |ingredient|
        total << ingredient
      end
    end
    total.uniq
  end
end
