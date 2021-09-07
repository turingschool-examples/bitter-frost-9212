# spec/features/dishes/show_spec.rb
require 'rails_helper'

RSpec.describe 'the dish show page' do
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

  it "shows the dish's name and description" do
    expect(page).to have_content(@dish_1.name)
    expect(page).to have_content(@dish_1.description)
  end

  it "shows a list of ingredients for the dish" do
    expect(page).to have_content(@ingred_1.name)
    expect(page).to have_content(@ingred_2.name)
    expect(page).to have_content(@ingred_3.name)
    expect(page).to have_content(@ingred_4.name)
    expect(page).to have_content(@ingred_5.name)
  end

  it "shows the dish's chef's name" do
    expect(page).to have_content(@chef.name)
  end
end
