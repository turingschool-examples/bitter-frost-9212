class Chef < ApplicationRecord
  has_many :dishes

  def ingredients
     Ingredient.joins(dishes: :chef).where('chefs.id = ?', self.id).distinct
   end
end
