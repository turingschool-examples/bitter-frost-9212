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

  it 'extension' do
    chef = Chef.create!(name: 'Bill')
    dish1 = chef.dishes.create!(name: 'Cereal', description: 'Milk not included')
    dish2 = chef.dishes.create!(name: 'Just Cereal', description: 'Bowl and Milk not included')
    dish3 = chef.dishes.create!(name: 'Bowl of Sadness', description: 'no cereal, just sadness')
    ingredient3 = Ingredient.create!(name: 'Heaps of Sugar', calories: 300)
    ingredient1 = Ingredient.create!(name: 'Fruit loops', calories: 30)
    ingredient2 = Ingredient.create!(name: 'Bowl', calories: 0)
    ingredient4 = Ingredient.create!(name: 'Banana Slices', calories: 50)

    dish1.ingredients << ingredient3
    dish1.ingredients << ingredient1
    dish1.ingredients << ingredient2

    dish2.ingredients << ingredient1
    dish2.ingredients << ingredient3

    dish3.ingredients << ingredient2
    dish3.ingredients << ingredient3
    dish3.ingredients << ingredient4

    visit "/chefs/#{chef.id}"

    expect(page).to have_content(ingredient1.name)
    expect(page).to have_content(ingredient2.name)
    expect(page).to have_content(ingredient3.name)
    expect(page).to_not have_content(ingredient4.name)
    expect(ingredient3.name).to appear_before(ingredient2.name)
    expect(ingredient3.name).to appear_before(ingredient1.name)

  end

end
