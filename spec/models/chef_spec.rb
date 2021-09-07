require 'rails_helper'

RSpec.describe Chef do
  describe 'relationships' do
    it { should have_many(:dishes) }
  end
  # 
  # it 'lists all ingredients the chef uses' do
  #   @chef = Chef.create!(name: "Chef Remy")
  #   @spag = @chef.dishes.create!(name: "Spaghetti and Meatballs", description: "Spaghetti noodles topped with marinara and meatballs")
  #   @lob_rav = @chef.dishes.create!(name: "Lobster Ravioloi", description: "Lobster filled ravioli in a cream sauce")
  #   @marinara = Ingredient.create!(name: "Marinara Sauce", calories: 80)
  #   @spaghetti = Ingredient.create!(name: "Spaghetti Noodles", calories: 250)
  #   @meatballs = Ingredient.create!(name: "Meatballs", calories: 250)
  #   @ravioli = Ingredient.create!(name: "Lobster raviolois", calories: 400)
  #   @cream_sauce = Ingredient.create!(name: "Cream sauce", calories: 325)
  #   DishIngredient.create!(dish: @spag, ingredient: @marinara)
  #   DishIngredient.create!(dish: @spag, ingredient: @spaghetti)
  #   DishIngredient.create!(dish: @spag, ingredient: @meatballs)
  #   DishIngredient.create!(dish: @lob_rav, ingredient: @ravioli)
  #   DishIngredient.create!(dish: @lob_rav, ingredient: @cream_sauce)
  #
  #   expect(@chef.list_ingredients).to eq([@marinara, @spaghetti, @meatballs, @ravioli, @cream_sauce])
  # end
end
