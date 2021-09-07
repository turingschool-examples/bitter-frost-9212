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
    save_and_open_page
  end
end
# As a visitorname:
# When I visit a dish's show page
# I see the dish’s name and description
# And I see a list of ingredients for that dish
# And I see the chef's name
