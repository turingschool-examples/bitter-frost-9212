require 'rails_helper'

RSpec.describe 'chef ingredients index' do
  let!(:chef) { Chef.create!(name: 'Gordon Ramsey') }

  let!(:dish) { Dish.create!(name: 'Pasta', description: 'Pasta and sauce', chef_id: chef.id) }
  let!(:noodles) { Ingredient.create!(name: 'Noodles', calories: 35) }
  let!(:sauce) { Ingredient.create!(name: 'Sauce', calories: 75) }

  let!(:dish2) { Dish.create!(name: 'Carroty Chicken', description: 'Chicken and carrots in sauce', chef_id: chef.id) }
  let!(:chicken) { Ingredient.create!(name: 'Chicken', calories: 123) }
  let!(:carrots) { Ingredient.create!(name: 'Carrots', calories: 45) }

  before :each do
    dish.ingredients << noodles
    dish.ingredients << sauce

    dish.ingredients << chicken
    dish.ingredients << carrots
    dish.ingredients << sauce

    visit chef_ingredients_path(chef.id)
  end

  it 'shows a list of unique ingredients' do
    expect(page).to have_content('Noodles')
    expect(page).to have_content('Sauce')
    expect(page).to have_content('Chicke')
    expect(page).to have_content('Carrots')
  end
end
