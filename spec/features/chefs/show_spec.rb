require 'rails_helper'

RSpec.describe 'chef show' do
  let!(:chef) { Chef.create!(name: 'Gordon Ramsey') }

  let!(:dish) { Dish.create!(name: 'Pasta', description: 'Pasta and sauce', chef_id: chef.id) }
  let!(:noodles) { Ingredient.create!(name: 'Noodles', calories: 35) }
  let!(:sauce) { Ingredient.create!(name: 'Sauce', calories: 75) }

  let(:dish2) { Dish.create!(name: 'Carroty Chicken', description: 'Chicken and carrots in sauce', chef_id: chef.id) }
  let(:chicken) { Ingredient.create!(name: 'Chicken', calories: 123) }
  let(:carrots) { Ingredient.create!(name: 'Carrots', calories: 45) }

  let(:dish3) { Dish.create!(name: 'Chicken noodle soup', description: 'Chicken noodle soup', chef_id: chef.id) }

  let(:dish4) { Dish.create!(name: 'Potatoe soup', description: 'Potatoes in sauce', chef_id: chef.id) }
  let(:potatoe) { Ingredient.create!(name: 'Potatoe', calories: 111111) }

  before :each do
    dish.ingredients << noodles
    dish.ingredients << sauce

    dish2.ingredients << chicken
    dish2.ingredients << carrots
    dish2.ingredients << sauce

    dish3.ingredients << chicken
    dish3.ingredients << noodles

    dish4.ingredients << potatoe
    dish4.ingredients << sauce

    visit chef_path(chef.id)
  end

  it 'has chef name' do
    expect(page).to have_content('Gordon Ramsey')
  end

  it 'has link to ingredients page' do
    click_on 'Chefs Ingredients'

    expect(current_path).to eq(chef_ingredients_path(chef.id))
  end

  it 'shows the 3 most popular ingredients' do
    expect('Sauce').to appear_before('Noodles', only_text: true)
    expect('Noodles').to appear_before('Chicken', only_text: true)
  end
end
