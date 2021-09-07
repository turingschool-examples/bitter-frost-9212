class Dish < ApplicationRecord

  belongs_to :chef
  has_many :ingredients

end
