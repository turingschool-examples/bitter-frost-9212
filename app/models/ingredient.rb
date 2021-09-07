class Ingredient < ApplicationRecord
  has_many :dish_ingredients
  has_many :dishes, through: :dish_ingredients

  validates :name, presence: true
  validates :calories, presence: true

  def self.for_chef(chef_id)
    joins(:dishes).where("dishes.chef_id = ?", chef_id).uniq
  end

  def self.most_pop(chef_id)
    joins(:dishes).
    where("dishes.chef_id = ?", chef_id).
    group("ingredients.id").
    order(Arel.sql("COUNT(ingredients.name) DESC")).
    limit(3)
  end
end
