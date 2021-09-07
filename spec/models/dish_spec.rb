require 'rails_helper'

RSpec.describe Dish do
  describe 'relationships' do
    it { should belong_to(:chef) }
    it { should have_many(:ingredients).through(:dish_ingredients) }
  end

  describe 'instance method' do
    describe '#total_calories' do
      it 'can calculate total calories of a dish' do
        chef = Chef.create!(name: 'Chef Khoi')
        dish = chef.dishes.create!(name: 'Pizza', description: 'Nothing special, really')
        cheese = Ingredient.create!(name: 'Mozeralla', calories: 78)
        pepperoni = Ingredient.create!(name: 'Pepperoni', calories: 90)
        DishIngredient.create!(dish: dish, ingredient: cheese)
        DishIngredient.create!(dish: dish, ingredient: pepperoni)

        expect(dish.total_calories).to eq(168)
      end
    end
  end
end
