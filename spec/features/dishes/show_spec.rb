require 'rails_helper'

RSpec.describe 'Dishes Show Page' do
  before :each do
    @ozz = Chef.create!(name: 'oz')
    @dish1 = @ozz.dishes.create!(chef_id: @ozz.id, name: 'pizza', description: 'slice of za')
    # @peperoni << @peperoni = Ingredients.create(name: 'peperoni', calories: 50)
    # @cheese << @cheese = Ingredients.create(name: 'cheese', calories: 100)
  end

  it 'show page includes a dish name and description' do
    visit("/dishes/#{@dish1.id}")
    expect(page).to have_content('pizza')
    expect(page).to have_content('slice of za')
    expect(page).to have_content('oz')
    expect(page).to have_content(@peperoni.name)
    save_and_open_page
    expect(page).to have_content(@cheese.name)
  end
end
