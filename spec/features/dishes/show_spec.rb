require 'rails_helper'

RSpec.describe 'the dishes show page' do
  before(:each) do
    @swedish_chef = Chef.create!(name: "Swedish Chef")
    @emeril       = Chef.create!(name: "Emeril Lagassi")

    @spaghetti     = @swedish_chef.dishes.create!(name: "Spaghetti", description: "It's noodles and sauce. What else do you want?!?")
    @meatball_sand = @emeril.dishes.create!(name: "Meatball Sandwich", description: 'Meats and breads. Sauce. Wow!')

    @noodles     = Ingredient.create!(name: "noodles", calories: 300)
    @sauce       = Ingredient.create!(name: "sauce", calories: 150)
    @bread       = Ingredient.create!(name: "bread", calories: 200)
    @meatballs   = Ingredient.create!(name: "meatballs", calories: 400)

    @spaghetti.ingredients << @noodles
    @spaghetti.ingredients << @sauce

    @meatball_sand.ingredients << @bread
    @meatball_sand.ingredients << @meatballs
    @meatball_sand.ingredients << @sauce
  end

  it "has a dish's name and description" do
    visit "/dishes/#{@spaghetti.id}"

    expect(page).to have_content("Spaghetti")
    expect(page).to have_content("It's noodles and sauce. What else do you want?!?")
  end

  it "has a list of ingredients" do
    visit "/dishes/#{@spaghetti.id}"

    expect(page).to have_content("Ingredients: noodles, sauce")
  end

  xit "has the chef's name" do

  end
end
