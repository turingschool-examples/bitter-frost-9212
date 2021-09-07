require 'rails_helper'

RSpec.describe 'dish show page' do
  it "shows the dish and it's attributes" do
    chef = Chef.create(name: 'Guy Fieri')
    dish = chef.dishes.create(name: 'Pizza', description: 'Yummy')

    visit "/dishes/#{dish.id}"

    expect(page).to have_content(dish.name)
    expect(page).to have_content(dish.description)
    expect(page).to have_content(dish.chef.name)
  end
end
# As a visitorname:
# When I visit a dish's show page
# I see the dish’s name and description
# And I see a list of ingredients for that dish
# And I see the chef's name
