class Ingredient < ApplicationRecord
  has_many :dish_ingredients
  has_many :dishes, through: :dish_ingredients

  def self.ingredients_by_chef(chef)
    Ingredient.joins(:dishes).where('chef_id = ?', chef.id).distinct
  end
end
