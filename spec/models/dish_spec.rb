require 'rails_helper'

RSpec.describe Dish do
  describe 'relationships' do
    it { should belong_to(:chef) }
    it { should have_many(:ingredients).through(:dish_ingredients) }
  end

  describe 'calorie counts' do
    let!(:chef) { Chef.create!(name: 'Gordon Ramsey') }
    let!(:dish) { Dish.create!(name: 'Pasta', description: 'Pasta and sauce', chef_id: chef.id) }
    let!(:noodles) { Ingredient.create!(name: 'Noodles', calories: 35) }
    let!(:sauce) { Ingredient.create!(name: 'Sauce', calories: 75) }

    before :each do
      dish.ingredients << noodles
      dish.ingredients << sauce
    end

    it 'has the total calorie count' do
      expect(dish.calories).to eq(110)
    end
  end
end
