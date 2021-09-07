require 'rails_helper'


RSpec.describe Ingredient do

  describe 'relationships' do
    it { should have_many(:dish_ingredients) }
    it { should have_many(:dishes).through(:dish_ingredients) }
  end


  it 'can fetch a chefs ingredients' do
    chef = Chef.create!(name: 'Bill')
    dish = chef.dishes.create!(name: 'Cereal', description: 'Milk not included')
    ingredient1 = Ingredient.create!(name: 'Fruit loops', calories: 30)
    ingredient2 = Ingredient.create!(name: 'Bowl', calories: 0)
    ingredient3 = Ingredient.create!(name: 'Heaps of Sugar', calories: 300)

    dish.ingredients << ingredient1
    dish.ingredients << ingredient2

    expect(Ingredient.ingredients_by_chef).to eq([ingredient1, ingredient2])
  end
end
