require 'rails_helper'

RSpec.describe Dish do
  describe 'relationships' do
    it { should belong_to(:chef) }
    it { should have_many(:ingredients).through(:dish_ingredients) }
    it { should have_many(:dish_ingredients) }

    it 'gets calorie count for dish' do
      chef = Chef.create(name: 'Guy Fieri')
      dish = chef.dishes.create(name: 'Pizza', description: 'Yummy')
      pep = dish.ingredients.create(name: 'Pepperoni', calories: 100)
      cheese = dish.ingredients.create(name: 'Cheddar', calories: 80)

      expect(dish.calorie_count).to eq(pep.calories + cheese.calories)
    end
  end
end
