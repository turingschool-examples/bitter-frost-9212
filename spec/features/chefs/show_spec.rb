require "rails_helper"

RSpec.describe 'the chef show page' do
  before(:each) do
    @swedish_chef = Chef.create!(name: "Swedish Chef")
    @emeril       = Chef.create!(name: "Emeril Lagassi")

    @spaghetti         = @swedish_chef.dishes.create!(name: "Spaghetti", description: "It's noodles and sauce. What else do you want?!?")
    @meatball_sand     = @emeril.dishes.create!(name: "Meatball Sandwich", description: 'Meats and breads. Sauce. Wow!')
    @fettucini_alfredo = @swedish_chef.dishes.create!(name: "fettucini_alfredo", description: "A creamy classic.")
    @pizza             = @swedish_chef.dishes.create!(name: "pizza", description: "You know what this is.")

    @noodles     = Ingredient.create!(name: "noodles",     calories: 300)
    @sauce       = Ingredient.create!(name: "sauce",       calories: 150)
    @bread       = Ingredient.create!(name: "bread",       calories: 200)
    @meatballs   = Ingredient.create!(name: "meatballs",   calories: 400)
    @cream_sauce = Ingredient.create!(name: "cream_sauce", calories: 400)
    @dough       = Ingredient.create!(name: "dough",       calories: 300)
    @cheese      = Ingredient.create!(name: "cheese",      calories: 200)

    @spaghetti.ingredients << @noodles
    @spaghetti.ingredients << @sauce

    @meatball_sand.ingredients << @bread
    @meatball_sand.ingredients << @meatballs
    @meatball_sand.ingredients << @sauce

    @fettucini_alfredo.ingredients << @noodles
    @fettucini_alfredo.ingredients << @cream_sauce
    @fettucini_alfredo.ingredients << @cheese

    @pizza.ingredients << @dough
    @pizza.ingredients << @sauce
    @pizza.ingredients << @cheese
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

  # it 'shows three most popular ingredients for the chef' do
  #   visit "/chefs/#{@swedish_chef.id}"
  #
  #   expect(page).to have_content("noodles, sauce, cheese")
  # end
end
