require 'rails_helper'

RSpec.describe Dish do
  before(:each) do
    @chef_1 = Chef.create!(name: "Ryan Gatorman")
    @dish_1 = Dish.create!(name: "Chilli of Forgiveness", description: "White bean turkey chilli with fall vegetables", chef: @chef_1)
    @ingredient_1 = Ingredient.create!(name: "Ground Turkey", calories: 90)
    @ingredient_2 = Ingredient.create!(name: "Butternut Squash", calories: 75)
    @ingredient_3 = Ingredient.create!(name: "Kale", calories: 50)
    @dish_1.ingredients << @ingredient_1
    @dish_1.ingredients << @ingredient_2
    @dish_1.ingredients << @ingredient_3
  end
  describe 'relationships' do
    it { should belong_to(:chef) }
    it {should have_many(:ingredient_dishes)}
    it {should have_many(:ingredients).through(:ingredient_dishes)}
  end

  describe 'instance methods' do
    it 'has total calories' do
      expect(@dish_1.total_cal).to eq(215)
    end
  end
end
