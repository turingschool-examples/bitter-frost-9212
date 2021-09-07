class Ingredient < ApplicationRecord
  has_many :dish_ingredients
  has_many :dishes, through: :dish_ingredients

  def self.ingredients_by_chef(chef_id)
    joins(:dishes).where('dishes.chef_id': chef_id).distinct
  end

  def self.popular_ingredients(chef_id)
    joins(:dishes).where('dishes.chef_id': chef_id).group('ingredients.id').order('COUNT(dishes.id) DESC').limit(3)
  end
end
