require 'rails_helper'

RSpec.describe 'dish show page' do
  before :each do
    @chef = Chef.create(name: 'Guy Fieri')
    @dish = @chef.dishes.create(name: 'Pizza', description: 'Yummy')
    @pep = @dish.ingredients.create(name: 'Pepperoni', calories: 100)
    @cheese = @dish.ingredients.create(name: 'Cheddar', calories: 80)

    visit "/dishes/#{@dish.id}"
  end
  it "shows the dish and it's attributes" do
    expect(page).to have_content(@dish.name)
    expect(page).to have_content(@dish.description)
    expect(page).to have_content(@dish.chef.name)
  end

  it 'shows a list of ingredients for the dish' do
    expect(page).to have_content(@pep.name)
    expect(page).to have_content(@cheese.name)
  end

  it 'shows the total calorie count for a dish' do
    expect(page).to have_content(@pep.calories + @cheese.calories)
  end
end
# As a visitor
# When I visit a dish's show page
# I see the total calorie count for that dish.
