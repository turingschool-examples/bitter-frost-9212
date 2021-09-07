require 'rails_helper'

RSpec.describe 'chef show page' do
  before :each do
    @chef = Chef.create(name: 'Guy Fieri')
    @dish = @chef.dishes.create(name: 'Pizza', description: 'Yummy')
    @pep = @dish.ingredients.create(name: 'Pepperoni', calories: 100)
    @cheese = @dish.ingredients.create(name: 'Cheddar', calories: 80)
    @pineapple = Ingredient.create(name: 'Pineapple', calories: 20)

    visit "/chefs/#{@chef.id}"
  end

  it 'shows the chef on show page' do
    expect(page).to have_content(@chef.name)
  end

  it 'has a link to view all of chefs ingredients' do
    click_link('All Ingredients')

    expect(current_path).to eq("/chefs/#{@chef.id}/ingredients")
    expect(page).to have_content(@pep.name)
    expect(page).to have_content(@cheese.name)
    expect(page).to_not have_content(@pineapple.name)
  end
end
