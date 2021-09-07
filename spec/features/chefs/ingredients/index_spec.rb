require 'rails_helper'

RSpec.describe 'chef ingredients index page' do
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

  it 'displays ingredients' do
    visit "/chefs/#{@chef_1.id}/ingredients"

    expect(page).to have_content("#{@ingredient_1.name}")
    expect(page).to have_content("#{@ingredient_2.name}")
    expect(page).to have_content("#{@ingredient_3.name}")
  end
end
