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

    expect(Ingredient.ingredients_by_chef(chef)).to eq([ingredient1, ingredient2])
  end

  it 'can fetch only the three most popular ingredients for a chef' do
    chef = Chef.create!(name: 'Bill')
    dish1 = chef.dishes.create!(name: 'Cereal', description: 'Milk not included')
    dish2 = chef.dishes.create!(name: 'Just Cereal', description: 'Bowl and Milk not included')
    dish3 = chef.dishes.create!(name: 'Bowl of Sadness', description: 'no cereal, just sadness')
    ingredient4 = Ingredient.create!(name: 'Banana Slices', calories: 50)
    ingredient3 = Ingredient.create!(name: 'Heaps of Sugar', calories: 300)
    ingredient1 = Ingredient.create!(name: 'Fruit loops', calories: 30)
    ingredient2 = Ingredient.create!(name: 'Bowl', calories: 0)

    dish1.ingredients << ingredient3
    dish1.ingredients << ingredient1
    dish1.ingredients << ingredient2

    dish2.ingredients << ingredient1
    dish2.ingredients << ingredient3

    dish3.ingredients << ingredient2
    dish3.ingredients << ingredient3
    dish3.ingredients << ingredient4

    expect(Ingredient.popular_ingredients(chef)).to eq([ingredient3, ingredient2, ingredient1])
  end
end
