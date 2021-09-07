class Chef < ApplicationRecord
  has_many :dishes

  def ingredients
    Ingredient.joins(dishes: :chef).where('chefs.id = ?', self.id).distinct
  end

  def three_most_popular_ingredients
    Ingredient.left_joins(dishes: :chef)
      .where('chefs.id = ?', self.id).group(:id)
      .order(Arel.sql('COUNT(dishes.id) DESC')).limit(3)
  end
end
