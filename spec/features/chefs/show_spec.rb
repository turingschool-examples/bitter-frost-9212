# spec/features/chefs/show_spec.rb
require 'rails_helper'

RSpec.describe 'the chef show page' do
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

  it "shows the name of the chef" do
    visit "/chefs/#{@chef.id}"

    expect(page).to have_content(@chef.name)
  end

  it "has a link to the chef's ingredient index" do
    visit "/chefs/#{@chef.id}"
    # save_and_open_page
    expect(has_link?("View Chef's Ingredients")).to eq(true)

    click_on "View Chef's Ingredients"
    expect(current_path).to eq("/chefs/#{@chef.id}/ingredients")
  end

  it "shows the chef's top three ingredients" do
    visit "/chefs/#{@chef.id}"
    save_and_open_page

    expect(page).to have_content(@ingred_2.name)
    expect(page).to have_content(@ingred_3.name)
    expect(page).to have_content(@ingred_4.name)
  end
end
