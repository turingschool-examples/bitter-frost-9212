require 'rails_helper'

RSpec.describe Ingredient do
  describe 'relationships' do
    it {should have_many :dish_ingredients }
    it {should have_many(:dishes).through(:dish_ingredients )}
  end

  it 'orders ingredients by name'  do
  chef = Chef.create!(name: "Chef Remi")
  dish_1 = chef.dishes.create!(name: "Pasta Al Dente", description: "Fresh pasta with your favorite sauce")
  ingredient_1 = Ingredient.create!(name: "Mozzarella", calories: 70)
  ingredient_2 = Ingredient.create!(name: "Rigatoni", calories: 10)
  dish_1.ingredients << ingredient_1
  dish_1.ingredients << ingredient_2

  expect(Ingredient.order_name).to eq([ingredient_1, ingredient_2])
  end
end
