require 'rails_helper'

RSpec.describe Dish do
  describe 'relationships' do
    it { should belong_to(:chef) }
    it { should have_many(:dish_ingredients) }
    it { should have_many(:ingredients).through(:dish_ingredients) }
  end

  before(:each) do
    @chef = Chef.create!(name: "Ida Olson")
    @dish_1 = Dish.create!(name: 'Capellini Pomodoro', description: "Capellini pomodoro is a classic combo of pasta, tomato sauce, garlic, olive oil, and basil.", chef_id: @chef.id)
    @ingred_1 = Ingredient.create!(name: "capellini", calories: 120)
    @ingred_2 = Ingredient.create!(name: "tomato sauce", calories: 60)
    @ingred_3 = Ingredient.create!(name: "garlic", calories: 10)
    @ingred_4 = Ingredient.create!(name: "olive oil", calories: 100)
    @ingred_5 = Ingredient.create!(name: "basil", calories: 5)
    @dish_1.ingredients << @ingred_1
    @dish_1.ingredients << @ingred_2
    @dish_1.ingredients << @ingred_3
    @dish_1.ingredients << @ingred_4
    @dish_1.ingredients << @ingred_5
  end

  it "can add up the calories of the ingredients in a dish" do
    expect(@dish_1.calories_per_dish).to eq(295)
  end
end
