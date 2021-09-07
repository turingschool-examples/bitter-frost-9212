require 'rails_helper'

RSpec.describe Dish do
  describe 'relationships' do
    it { should have_many(:ingredient_dishes) }
    it { should belong_to(:chef) }
    it { should have_many(:ingredients) }
  end

  describe 'Total calorie count' do
    it "can list the total calorie count from ingredients" do
      # Create a chef
      @gordon_ramsey = Chef.create!(name: "Gordon Ramsey")

      # Create a dish
      @omelette = @gordon_ramsey.dishes.create!(name: "Omelette", description: "Eggs with your choice of ingredients")

      # Create an ingredient
      @egg = Ingredient.create!(name: "Egg", calories: 78)

      # Create IngredientDish
      IngredientDish.create!(dish: @omelette, ingredient: @egg)

      expect(@omelette.total_calorie_count).to eq(78)
    end
  end
end
