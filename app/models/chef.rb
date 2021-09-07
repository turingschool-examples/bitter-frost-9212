class Chef < ApplicationRecord
  has_many :dishes

  def self.ingredients
    dish.ingredients
  end
end
