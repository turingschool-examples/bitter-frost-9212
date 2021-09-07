require 'rails_helper'

RSpec.describe 'Dishes Show Page' do
  before :each do
    @ozz = Chef.create(name: 'oz')
    @ozz << @dish1 = Dish.create(name: 'pizza', description: 'slice of za')
    @peperoni << @peperoni = Ingredients.create(name: 'peperoni', calories: 50)
    @cheese << @cheese = Ingredients.create(name: 'cheese', calories: 100)
  end

  it 'show page includes a dish name and description' do
    visit("/Dishes/#{@dish1}")

    expect(page).to have_content(@dish1.name)
    expect(page).to have_content(@dish1.description)
    expect(page).to have_content(@peperoni.name)
    expect(page).to have_content(@cheese.name)
    expect(page).to have_content(@ozz.name)
  end
end
