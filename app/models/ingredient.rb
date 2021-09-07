class Ingredient < ApplicationRecord

  has_many :dishes

  # def total_calories_count
  #   where("")
  # end
end
