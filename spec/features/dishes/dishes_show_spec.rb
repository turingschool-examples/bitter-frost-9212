# Story 1 of 3
# As a visitor
# When I visit a dish's show page
# I see the dish’s name and description
# And I see a list of ingredients for that dish
# And I see the chef's name

require 'rails_helper'

RSpec.describe 'the dishes attributes' do
  it "displays the dish's name and description" do
    chef = Chef.create!(name: 'Ramsey')
    dish = Dish.create!(name: 'Pasta Al Dente', description: 'Fresh pasta with your favorite sauce', chef_id: chef.id)
    ingredient = Ingredients.create!(name: 'Mozzarella', calories: 78)
    ingredient2 = Ingredients.create!(name: 'Tomato Sauce', calories: 92)

    visit "/dishes/#{dish.id}"

    expect(page).to have_content(dish.name)
    expect(page).to have_content(dish.description)

    expect(page).to have_content(ingredient.name)
    expect(page).to have_content(ingredient.description)
    expect(page).to have_content(ingredient2.name)
    expect(page).to have_content(ingredient2.description)
  end
end
