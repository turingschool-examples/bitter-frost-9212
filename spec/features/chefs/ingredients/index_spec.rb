require 'rails_helper'

RSpec.describe 'chef ingredients index page' do
  before(:each) do
    @chef_1 = Chef.create!(name: "Ryan Gatorman")
    @chef_2 = Chef.create!(name: "Risky Riskin")
    @dish_1 = Dish.create!(name: "Chilli of Forgiveness", description: "White bean turkey chilli with fall vegetables", chef: @chef_1)
    @dish_2 = Dish.create!(name: "Breakfast Bowl", description: "Easy breakfast bowl to start any day.", chef: @chef_2)
    @ingredient_1 = Ingredient.create!(name: "Ground Turkey", calories: 90)
    @ingredient_2 = Ingredient.create!(name: "Butternut Squash", calories: 75)
    @ingredient_3 = Ingredient.create!(name: "Kale", calories: 50)
    @ingredient_4 = Ingredient.create!(name: "Egg", calories: 50)
    @ingredient_5 = Ingredient.create!(name: "Chorizo", calories: 120)
    @dish_1.ingredients << @ingredient_1
    @dish_1.ingredients << @ingredient_2
    @dish_1.ingredients << @ingredient_3
  end

  it 'displays ingredients' do
    visit "/chefs/#{@chef_1.id}/ingredients"

    expect(page).to have_content(@ingredient_1.name)
    expect(page).to have_content(@ingredient_2.name)
    expect(page).to have_content(@ingredient_3.name)
    expect(page).to_not have_content(@ingredient_4.name)
    expect(page).to_not have_content(@ingredient_5.name)
  end

  it 'exists for chefs without ingredients' do
    visit "/chefs/#{@chef_2.id}/ingredients"

    expect(page).to_not have_content(@ingredient_4.name)
    expect(page).to_not have_content(@ingredient_5.name)
    expect(page).to_not have_content(@ingredient_3.name)
    expect(page).to_not have_content(@ingredient_1.name)
    expect(page).to_not have_content(@ingredient_2.name)

    @dish_2.ingredients << @ingredient_3
    @dish_2.ingredients << @ingredient_4
    @dish_2.ingredients << @ingredient_5

    visit "/chefs/#{@chef_2.id}/ingredients"
    expect(page).to have_content(@ingredient_4.name)
    expect(page).to have_content(@ingredient_5.name)
    expect(page).to have_content(@ingredient_3.name)
    expect(page).to_not have_content(@ingredient_1.name)
    expect(page).to_not have_content(@ingredient_2.name)
  end
end
