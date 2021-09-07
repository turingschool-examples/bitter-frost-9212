class Chef < ApplicationRecord
  has_many :dishes

  def ingredients
    ingredients = Ingredient.select(:name).
                             joins(dishes: :dish_ingredients).
                             joins(dishes: :chef).
                             where("chefs.id = #{id}").
                             group(:id).
                             order(:name)

    list = ""
    ingredients.each do |ingredient|
      list += "#{ingredient.name}, "
    end
    list.chop.chop
  end
end
