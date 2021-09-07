require 'rails_helper'

RSpec.describe 'chef show' do
  let!(:chef) { Chef.create!(name: 'Gordon Ramsey') }

  let!(:dish) { Dish.create!(name: 'Pasta', description: 'Pasta and sauce', chef_id: chef.id) }
  let!(:noodles) { Ingredient.create!(name: 'Noodles', calories: 35) }
  let!(:sauce) { Ingredient.create!(name: 'Sauce', calories: 75) }

  before :each do
    dish.ingredients << noodles
    dish.ingredients << sauce

    visit chef_path(chef.id)
  end

  it 'has chef name' do
    expect(page).to have_content('Gordon Ramsey')
  end

  it 'has link to ingredients page' do
    click_on 'Chefs Ingredients'

    expect(current_path).to eq(chef_ingredients_path(chef.id))
  end
end
