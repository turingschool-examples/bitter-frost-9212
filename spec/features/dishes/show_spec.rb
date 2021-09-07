require 'spec_helper'

RSpec.describe 'dishes show page' do
  it 'shows dish name and description' do
    chef_1 = Chef.create!(name: "Murph")
    dish_1 = Dish.create!(name: "Spaghetti", description: "noodles and sauce")
    dish_2 = Dish.create!(name: "Smoothie", description: "fruits blended together")
    ingredient_1 = dish_1.ingredients.create!(name: "noodles", calories: 200)
    ingredient_2 = dish_1.ingredients.create!(name: "sauce", calories: 80)
    ingredient_3 = dish_1.ingredients.create!(name: "strawberries", calories: 30)
    ingredient_4 = dish_1.ingredients.create!(name: "blueberries", calories: 40)

    visit "/dishes/#{dish_1.id}"

    expect(page).to have_content(dish_1.name)
    expect(page).to have_content(dish_2.name)
    expect(page).to have_content(dish_1.description)
    expect(page).to have_content(dish_2.description)
  end
end