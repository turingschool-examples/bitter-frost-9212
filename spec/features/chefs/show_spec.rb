require 'rails_helper'

RSpec.describe 'chefs show page' do
  before(:each) do
    @chef_1 = Chef.create!(name: "Ryan Gatorman")
    @chef_2 = Chef.create!(name: "Risky Riskin")
    @dish_1 = Dish.create!(name: "Chilli of Forgiveness", description: "White bean turkey chilli with fall vegetables", chef: @chef_1)
    @dish_2 = Dish.create!(name: "Breakfast Bowl", description: "Easy breakfast bowl to start any day.", chef: @chef_1)
    @dish_3 = Dish.create!(name: "Egg Roll in a Bowl", description: "Tasty Asian inspired lunch bowl", chef: @chef_1)
    @ingredient_1 = Ingredient.create!(name: "Ground Turkey", calories: 90)
    @ingredient_2 = Ingredient.create!(name: "Butternut Squash", calories: 75)
    @ingredient_3 = Ingredient.create!(name: "Kale", calories: 50)
    @ingredient_4 = Ingredient.create!(name: "Egg", calories: 50)
    @ingredient_5 = Ingredient.create!(name: "Chorizo", calories: 120)
    @ingredient_6 = Ingredient.create!(name: "Rice", calories: 90)
    @dish_1.ingredients << @ingredient_1
    @dish_1.ingredients << @ingredient_2
    @dish_1.ingredients << @ingredient_3
    @dish_2.ingredients << @ingredient_3
    @dish_2.ingredients << @ingredient_4
    @dish_2.ingredients << @ingredient_5
    @dish_3.ingredients << @ingredient_1
    @dish_3.ingredients << @ingredient_3
    @dish_3.ingredients << @ingredient_4
    @dish_3.ingredients << @ingredient_6
  end

  it 'displays' do
    visit "/chefs/#{@chef_1.id}"

    expect(page).to have_content(@chef_1.name)
    expect(page).to_not have_content(@chef_2.name)
    expect(page).to have_content(@ingredient_3.name)
    expect(page).to have_content(@ingredient_4.name)
    expect(page).to have_content(@ingredient_1.name)
    expect(@ingredient_3.name).to appear_before(@ingredient_4.name, only_text: true)
    expect(@ingredient_4.name).to appear_before(@ingredient_1.name, only_text: true)
    expect(page).to have_button("#{@chef_1.name} Trusted Ingredients")
    expect(page).to_not have_button("#{@chef_2.name} Trusted Ingredients")
  end

  it 'has link to chefs ingredients' do
    visit "/chefs/#{@chef_1.id}"

    click_on "#{@chef_1.name} Trusted Ingredients"
    expect(current_path).to eq("/chefs/#{@chef_1.id}/ingredients")

    visit "/chefs/#{@chef_2.id}"

    click_on "#{@chef_2.name} Trusted Ingredients"
    expect(current_path).to eq("/chefs/#{@chef_2.id}/ingredients")
  end
end
