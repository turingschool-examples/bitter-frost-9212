require 'rails_helper'

RSpec.describe 'Dishes Show Page' do
  before :each do
    @ozz = Chef.create!(name: 'oz')
    @dish1 = Dish.create!(chef_id: @ozz.id, name: 'pizza', description: 'slice of za')
    @dish1.ingredients << @peperoni = Ingredient.create!(name: 'peperoni', calories: 50)
    @dish1.ingredients << @cheese = Ingredient.create(name: 'cheese', calories: 100)
  end

  it 'show page includes a dish name and description' do
    visit("/dishes/#{@dish1.id}")

    expect(page).to have_content('pizza')
    expect(page).to have_content('slice of za')
    expect(page).to have_content('oz')
    save_and_open_page
    expect(page).to have_content(@peperoni.name)
    expect(page).to have_content(@cheese.name)
  end

  it 'includes the total calories for a dish' do
    visit("/dishes/#{@dish1.id}")

    expect(@dish1.dish_calories).to eq(150)
    expect(page).to have_content('150')
  end
end
