class Dish < ApplicationRecord

  belongs_to :chef
  has_many :ingredients

  # def self.total_calories_count
  #   where("dish.id == ingredient.id").sum(:calories)
  # end
end
