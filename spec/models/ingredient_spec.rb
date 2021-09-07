require 'rails_helper'

RSpec.describe Ingredient do
  describe 'relationships' do
    it {should have_many :dish_ingredients }
    it {should have_many(:dishes).through(:dish_ingredients )}
  end


    it 'should be able to tell the total calorie count for a dish' do
      chef = Chef.create!(name: "Chef Remi")
      dish_1 = chef.dishes.create!(name: "Pasta Al Dente", description: "Fresh pasta with your favorite sauce")
      ingredient_1 = dish_1.ingredients.create!(name: "Mozzarella", calories: 70)
      ingredient_2 = dish_1.ingredients.create!(name: "Rigatoni", calories: 10)

      expect(Ingredient.calorie_total).to eq(80)
    end
end
