require 'rails_helper'

RSpec.describe 'dish show page' do
  before :each do
    @chef = Chef.create(name: 'Guy Fieri')
    @dish = @chef.dishes.create(name: 'Pizza', description: 'Yummy')
    @pep = @dish.ingredients.create(name: 'Pepperoni', calories: 100)
    @cheese = @dish.ingredients.create(name: 'Cheddar', calories: 80)

    visit "/chefs/#{@chef.id}"
  end

  it 'shows the chef on show page' do
    expect(page).to have_content(@chef.name)
  end
end
