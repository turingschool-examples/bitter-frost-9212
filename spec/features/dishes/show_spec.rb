require 'rails_helper'

RSpec.describe 'the dishs show page'do

  it "can list all dish attributes and chef's name" do
    # Create a chef
    @gordon_ramsey = Chef.create!(name: "Gordon Ramsey")

    # Create a dish
    @omelette = @gordon_ramsey.dishes.create!(name: "Omelette", description: "Eggs with your choice of ingredients")

    # Create an ingredient
    @egg = Ingredient.create!(name: "Egg", calories: 78)

    # Create IngredientDish
    IngredientDish.create!(dish: @omelette, ingredient: @egg)

    visit "/dish/#{@omelette.id}"

    expect(page).to have_content(@omelette.name)
    expect(page).to have_content(@omelette.description)
    expect(page).to have_content(@gordon_ramsey.name)
    expect(page).to have_content(@egg.name)
  end

  it "can list the total calorie count" do
    # Create a chef
    @gordon_ramsey = Chef.create!(name: "Gordon Ramsey")

    # Create a dish
    @omelette = @gordon_ramsey.dishes.create!(name: "Omelette", description: "Eggs with your choice of ingredients")

    # Create an ingredient
    @egg = Ingredient.create!(name: "Egg", calories: 78)

    # Create IngredientDish
    IngredientDish.create!(dish: @omelette, ingredient: @egg)

    visit "/dish/#{@omelette.id}"

    expect(page).to have_content(@egg.calories)
  end
end
