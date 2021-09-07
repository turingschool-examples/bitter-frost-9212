require 'rails_helper'

RSpec.describe Dish do
  describe 'relationships' do
    it { should belong_to(:chef) }
  end

  describe 'methods' do
    before :each do
      @ozz = Chef.create!(name: 'oz')
      @dish1 = Dish.create!(chef_id: @ozz.id, name: 'pizza', description: 'slice of za')
      @dish1.ingredients << @peperoni = Ingredient.create!(name: 'peperoni', calories: 50)
      @dish1.ingredients << @cheese = Ingredient.create(name: 'cheese', calories: 100)
    end

    it 'returns total calories of dish' do
      expect(@dish1.ingredients.dish_calories).to eq(150)
    end
  end
end
