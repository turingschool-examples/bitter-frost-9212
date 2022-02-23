# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Dish do
  describe 'relationships' do
    it { should belong_to(:chef) }
    it { should have_many(:dish_ingredients) }
    it { should have_many(:ingredients).through(:dish_ingredients) }
  end

  describe 'attributes' do
    it 'has a name' do
      chef1 = Chef.create!(name: 'kevin')
      dish1 = chef1.dishes.create!(name: 'Lasagna', description: 'Delicious')

      expect(dish1.name).to eq('Lasagna')
    end

    it 'has a description' do
      chef1 = Chef.create!(name: 'kevin')
      dish1 = chef1.dishes.create!(name: 'Lasagna', description: 'Delicious')

      expect(dish1.description).to eq('Delicious')
    end

    it 'has a chef id' do
      chef1 = Chef.create!(name: 'kevin')
      dish1 = chef1.dishes.create!(name: 'Lasagna', description: 'Delicious')

      expect(dish1.chef_id).to eq(chef1.id)
    end
  end

  it 'calculates total calories' do
    @chef1 = Chef.create!(name: 'kevin')
    @dish1 = @chef1.dishes.create!(name: 'Lasagna', description: 'Delicious')
    @ingredient1 = Ingredient.create!(name: 'Cheese', calories: 100)
    @ingredient2 = Ingredient.create!(name: 'Milk', calories: 75)
    @dish_ing1 = DishIngredient.create!(dish_id: @dish1.id, ingredient_id: @ingredient1.id)
    @dish_ing2 = DishIngredient.create!(dish_id: @dish1.id, ingredient_id: @ingredient2.id)

    expect(@dish1.total_calories).to eq(175)
  end
end
