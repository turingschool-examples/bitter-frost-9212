require 'rails_helper'

RSpec.describe 'Dish#show page' do
  before :each do
    @chef_1 = Chef.create!(name: 'JJ')
    # @chef_2 = Chef.create!(name: 'Mally')

    @dish_1 = @chef_1.dishes.create!(name: 'Steak Tacos', description: 'Authentic Carne Asada' )
    @dish_2 = @chef_1.dishes.create!(name: 'MacNcheese', description: 'Not your mommas')

    @ingredient_1 = @dish_1.ingredients.create!(name: 'Corn Tortillas', calories: 20)
    @ingredient_2 = @dish_1.ingredients.create!(name: 'Steak', calories: 75)
    @ingredient_3 = @dish_1.ingredients.create!(name: 'Cilantro', calories: 5)
  end

  it 'should display all the dish names and description' do
    visit "/dishes/#{@dish_1.id}"
    save_and_open_page

    expect(page).to have_content("#{@dish_1.name}")
    expect(page).to have_content("#{@dish_1.description}")
  end

  it "can list the ingredients in a dish" do
    visit "/dishes/#{@dish_1.id}"
    save_and_open_page

    expect(page).to have_content(@ingredient_1.name)
    expect(page).to have_content(@ingredient_2.name)
    expect(page).to have_content(@ingredient_3.name)

  end

  it "can list the chefs name" do
    visit "/dishes/#{@dish_1.id}"
    save_and_open_page

    expect(page).to have_content(@chef_1.name)
  end

  it "can list total calories in a dish" do
    visit "/dishes/#{@dish_1.id}"
    save_and_open_page

    expect(page).to have_content("100 calories")
  end
end
