require 'rails_helper'

RSpec.describe 'dish show page' do
  let!(:chef) { Chef.create!(name: 'Gordon Ramsey') }
  let!(:dish) { Dish.create!(name: 'Pasta', description: 'Pasta and sauce', chef_id: chef.id) }
  let!(:noodles) { Ingredient.create!(name: 'Noodles', calories: 35) }
  let!(:sauce) { Ingredient.create!(name: 'Sauce', calories: 75) }

  before :each do
    dish.ingredients << noodles
    dish.ingredients << sauce

    visit dish_path(dish.id)
  end

  it 'has its name and ingredients' do
    expect(page).to have_content('Pasta')
    expect(page).to have_content('Pasta and sauce')
  end

  it 'has its ingredients' do
    expect(page).to have_content('Noodles')
    expect(page).to have_content('Sauce')
  end

  it 'has chef name' do
    expect(page).to have_content('Gordon Ramsey')
  end
end
