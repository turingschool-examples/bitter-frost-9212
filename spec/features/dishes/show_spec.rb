require 'rails_helper'


RSpec.describe 'dish show page' do

  it 'story 1' do

    chef = Chef.create!(name: 'Bill')
    dish = chef.dishes.create!(name: 'Cereal', description: 'Milk not included')
    ingredient1 = Ingredient.create!(name: 'Fruit loops', calories: 30)
    ingredient2 = Ingredient.create!(name: 'Bowl', calories: 0)

    visit "/dishes/#{dish.id}"

    expect(page).to have_content(dish.name)
    expect(page).to have_content(dish.description)
    expect(page).to have_content(ingredient1.name)
    expect(page).to have_content(ingredient2.name)
    expect(page).to have_content(chef.name)

  end

end
#
# As a visitor
# When I visit a dish's show page
# I see the dish’s name and description
# And I see a list of ingredients for that dish
# And I see the chef's name
