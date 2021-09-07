class Chef < ApplicationRecord
  has_many :dishes

  def ingredients
    dishes.select("ingredients.*").joins(:ingredients).uniq.pluck(:name)
  end
end
