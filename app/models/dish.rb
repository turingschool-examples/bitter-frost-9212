class Dish < ApplicationRecord
  belongs_to :chef
  has_many :dish_ingredients
  has_many :dishes, through: :dish_ingredients

  validates :name, presence: true
  validates :description, presence: true
end
