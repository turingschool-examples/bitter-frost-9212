require 'rails_helper'

RSpec.describe 'the dishes show page' do
  before(:each) do
    @chef_1 = Chef.create!(name: "Swedish Chef")
    @chef_2 = Chef.create!(name: "Emeril Lagassi")

    @dish_1 = @chef_1.dishes.create!(name: "Spaghetti", description: "It's noodles and sauce. What else do you want?!?")
    @dish_2 = @chef_2.dishes.create!(name: "Meatball Sandwich", description: 'Meats and breads. Sauce. Wow!')
  end

  it "has a dish's name and description" do
    visit "/dishes/#{@dish_1.id}"

    expect(page).to have_content("Spaghetti")
    expect(page).to have_content("It's noodles and sauce. What else do you want?!?")
  end

  xit "has a list of ingredients" do

  end

  xit "has the chef's name" do

  end
end
