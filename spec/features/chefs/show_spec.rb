require "rails_helper"


RSpec.describe 'chef show page' do


  it 'story 3' do
    chef = Chef.create!(name: 'Bill')
    dish1 = chef.dishes.create!(name: 'Cereal', description: 'Milk not included')
    dish2 = chef.dishes.create!(name: 'Just Cereal', description: 'Bowl and Milk not included')
    ingredient1 = Ingredient.create!(name: 'Fruit loops', calories: 30)
    ingredient2 = Ingredient.create!(name: 'Bowl', calories: 0)

    dish1.ingredients << ingredient1
    dish1.ingredients << ingredient2
    dish2.ingredients << ingredient1

    visit "/chefs/#{chef.id}"

    expect(page).to have_link('all_ingredients')

    click_link 'all_ingredients'

    expect(current_path).to eq("/chefs/#{chef.id}/ingredients")
    expect(page).to have_content(ingredient1.name, count: 1)
    expect(page).to have_content(ingredient2.name)

  end

end
