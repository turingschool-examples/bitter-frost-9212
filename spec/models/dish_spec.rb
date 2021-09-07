require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe 'relationships' do
    it { should belong_to(:chef) }
    it { should have_many(:ingredients).through(:dish_ingredients) }
    it { should have_many(:dish_ingredients) }
  end

  it 'sums calories' do
    def calorie_count
      chef = Chef.create!(name: 'Chef Remy')
      dish = Dish.create!(name: 'Pasta Al Dente', description: 'Fresh pasta with your favorite sauce', chef_id: chef.id)
      ingredient1 = Ingredient.create!( name: 'Mozzarella', calories: 78)
      ingredient2 = Ingredient.create!( name: 'Basil', calories: 8)

      dish.ingredients << ingredient1
      dish.ingredients << ingredient2

      expect(dish.total_calories).to eq(86)
    end
  end
end
