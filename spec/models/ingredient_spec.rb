require 'rails_helper'

RSpec.describe Ingredient do
  describe 'relationships' do
    it { should have_many(:dish_ingredients) }
    it { should have_many(:dishes).through(:dish_ingredients) }
  end

  describe 'attributes' do
    it "has a name" do
      ingredient1 = Ingredient.create!(name: "Cheese", calories: 100)

      expect(ingredient1.name).to eq("Cheese")
    end

    it "has calories" do
      ingredient1 = Ingredient.create!(name: "Cheese", calories: 100)

      expect(ingredient1.calories).to eq(100)
    end
  end
end
