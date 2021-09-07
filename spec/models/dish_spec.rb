require 'rails_helper'

RSpec.describe Dish do
  describe 'relationships' do
    it { should belong_to(:chef) }
    it { should have_many(:dish_ingredients) }
    it { should have_many(:ingredients).through(:dish_ingredients) }
  end

  describe 'instance methods' do

    it 'can count calories' do
      chef = Chef.create!(name: 'Bill')
      dish = chef.dishes.create!(name: 'Cereal', description: 'Milk not included')
      ingredient1 = Ingredient.create!(name: 'Fruit loops', calories: 30)
      ingredient2 = Ingredient.create!(name: 'Bowl', calories: 13)

      expect(dish.calories).to eq(0)

      dish.ingredients << ingredient1

      expect(dish.calories).to eq(30)

      dish.ingredients << ingredient2

      expect(dish.calories).to eq(43)

    end
  end
end
