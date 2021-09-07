require 'rails_helper'

RSpec.describe 'dish show page' do

  it 'shows dishes name and description' do
    chef = Chef.create!(name: "John")
    dish = chef.dishes.create!(name: "Lasagna", description: "Italian meal")

    visit "/dishes/#{dish.id}"
    expect(page).to have_content("Lasagna")
    expect(page).to have_content("Italian meal")
  end

  it 'shows list of ingredients for that dish' do
    chef = Chef.create!(name: "John")
    dish = chef.dishes.create!(name: "Lasagna", description: "Italian meal")
    ingredient1 = Ingredient.create!(name: "Pasta", calories: 100)
    dish.dishes_ingredients.create!(ingredient: ingredient1)

    visit "dishes/#{dish.id}"

    expect(page).to have_content(ingredient1.name)
  end

  it 'shows the name of the chef who made that dish' do
    chef = Chef.create!(name: "John")
    dish = chef.dishes.create!(name: "Lasagna", description: "Italian meal")
    ingredient1 = Ingredient.create!(name: "Pasta", calories: 100)
    dish.dishes_ingredients.create!(ingredient: ingredient1)

    visit "dishes/#{dish.id}"

    expect(page).to have_content(chef.name)
  end

  it 'shows the total calories for a dish' do
    chef = Chef.create!(name: "John")
    dish = chef.dishes.create!(name: "Lasagna", description: "Italian meal")
    ingredient1 = Ingredient.create!(name: "Pasta", calories: 100)
    dish.dishes_ingredients.create!(ingredient: ingredient1)

    visit "dishes/#{dish.id}"

    expect(dish.total_calories).to eq(100)
  end
end
