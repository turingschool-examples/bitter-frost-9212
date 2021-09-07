require 'rails_helper'

RSpec.describe Dish do
  describe 'relationships' do
    it { should belong_to(:chef) }
    it { should have_many(:dish_ingredients) }
    it { should have_many(:ingredients).through(:dish_ingredients) }
  end

  it 'can calculate total calories in a dish' do
    @chef = Chef.create!(name: "Chef Remy")
    @spag = @chef.dishes.create!(name: "Spaghetti and Meatballs", description: "Spaghetti noodles topped with marinara and meatballs")
    @lob_rav = @chef.dishes.create!(name: "Lobster Ravioloi", description: "Lobster filled ravioli in a cream sauce")
    @marinara = Ingredient.create!(name: "Marinara Sauce", calories: 80)
    @spaghetti = Ingredient.create!(name: "Spaghetti Noodles", calories: 250)
    @meatballs = Ingredient.create!(name: "Meatballs", calories: 250)
    @ravioli = Ingredient.create!(name: "Lobster raviolois", calories: 400)
    @cream_sauce = Ingredient.create!(name: "Cream sauce", calories: 325)
    DishIngredient.create!(dish: @spag, ingredient: @marinara)
    DishIngredient.create!(dish: @spag, ingredient: @spaghetti)
    DishIngredient.create!(dish: @spag, ingredient: @meatballs)
    DishIngredient.create!(dish: @lob_rav, ingredient: @ravioli)
    DishIngredient.create!(dish: @lob_rav, ingredient: @cream_sauce)

    expect(@spag.calorie_count).to eq(580)
    expect(@lob_rav.calorie_count).to eq(725)
  end


end
