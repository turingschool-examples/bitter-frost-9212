require "rails_helper"

RSpec.describe 'the chef show page' do
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

  it 'shows the name of the chef' do
    visit "/chefs/#{@swedish_chef.id}"

    expect(page).to have_content("Swedish Chef")
  end

  it 'has a link to the ingredients they use' do
    visit "/chefs/#{@swedish_chef.id}"

    click_link("Ingredients Used")

    expect(current_path).to eq("/chefs/#{@swedish_chef.id}/ingredients")
    expect(page).to have_content("noodles, sauce")

    visit "/chefs/#{@emeril.id}"

    click_link("Ingredients Used")

    expect(current_path).to eq("/chefs/#{@emeril.id}/ingredients")
    expect(page).to have_content("bread, meatballs, sauce")
  end
end


# As a visitor
# When I visit a chef's show page
# I see the name of that chef
# And I see a link to view a list of all ingredients that this chef uses in their dishes
# When I click on that link
# I'm taken to a chef's ingredient index page
# and I can see a unique list of names of all the ingredients that this chef uses
