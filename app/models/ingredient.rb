class Ingredient < ApplicationRecord
  has_many :dish_ingredients
  has_many :dishes, through: :dish_ingredients

  def self.ingredients_by_chef(chef)
    Ingredient.joins(:dishes).where('chef_id = ?', chef.id).distinct
  end

  def self.popular_ingredients(chef)
    require "pry"; binding.pry
    Ingredient.joins(:dishes).where('chef_id = ?', chef.id).group(:ingredient_id).count

  end

  def self.popular_ingredients_id_count_hash(chef)

  end
end
