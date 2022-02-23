# frozen_string_literal: true

class Chef < ApplicationRecord
  has_many :dishes

  def ingredients
    Ingredient.joins(dishes: :chef).where('chefs.id = ?', id).distinct
  end
end
