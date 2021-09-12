class Chef < ApplicationRecord
  has_many :dishes

  def unique_list_of_ingredients
    Ingredient.joins(:dishes).where("dishes.chef_id = #{self.id}").distinct
  end  
end
