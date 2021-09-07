class Chef < ApplicationRecord
  has_many :dishes

  def uniq_ingred
    require "pry"; binding.pry
    joins(dishes: :ingredients)
    select(:ingredients).distinct

  end
end
