require 'rails_helper'

RSpec.describe Chef do
  describe 'relationships' do
    it { should have_many(:dishes) }
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
    @dish_2 = Dish.create!(name: 'Penne Arrabiata', description: "The Classic Arrabiata is made with sweet San Marzano tomatoes, ots of garlic and red pepper flakes.", chef_id: @chef.id)
    @ingred_6 = Ingredient.create!(name: "penne", calories: 120)
    @ingred_7 = Ingredient.create!(name: "tomato sauce", calories: 60)
    @ingred_8 = Ingredient.create!(name: "garlic", calories: 10)
    @ingred_9 = Ingredient.create!(name: "olive oil", calories: 100)
    @ingred_10 = Ingredient.create!(name: "parsley", calories: 5)
    @ingred_11 = Ingredient.create!(name: "red pepper flakes", calories: 2)
    @dish_2.ingredients << @ingred_6
    @dish_2.ingredients << @ingred_7
    @dish_2.ingredients << @ingred_8
    @dish_2.ingredients << @ingred_9
    @dish_2.ingredients << @ingred_10
    @dish_2.ingredients << @ingred_11
  end

  it "returns an array of all the ingredients used by the chef with no repeats" do
    expect(@chef.ingredients_index).to eq(["capellini", "tomato sauce", "garlic", "olive oil", "basil", "penne", "parsley", "red pepper flakes"])
  end
end
