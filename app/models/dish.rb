class Dish < ApplicationRecord
  belongs_to :chef
  has_many :dish_ingredients
  has_many :ingredients, through: :dish_ingredients

  validates :name, presence: true
  validates :description, presence: true

  def cal_count
    ingredients.sum(:calories)
  end
end
