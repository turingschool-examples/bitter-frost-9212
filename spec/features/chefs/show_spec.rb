require 'rails_helper'

RSpec.describe 'the chefs show page'do

  describe 'The chefs show page' do
    it "can see name of chef and a link to all of their ingredients" do
      # Create a chef
      @gordon_ramsey = Chef.create!(name: "Gordon Ramsey")

      # Create a dish
      @omelette = @gordon_ramsey.dishes.create!(name: "Omelette", description: "Eggs with your choice of ingredients")

      # Create an ingredient
      @egg = Ingredient.create!(name: "Egg", calories: 78)

      # Create IngredientDish
      IngredientDish.create!(dish: @omelette, ingredient: @egg)

      visit "/chef/#{@gordon_ramsey.id}"

      expect(page).to have_content(@gordon_ramsey.name)
      expect(page).to have_link("View All Ingredients")
    end

    it "can click link and be taken to ingredient index page" do
      # Create a chef
      @gordon_ramsey = Chef.create!(name: "Gordon Ramsey")

      # Create a dish
      @omelette = @gordon_ramsey.dishes.create!(name: "Omelette", description: "Eggs with your choice of ingredients")

      # Create an ingredient
      @egg = Ingredient.create!(name: "Egg", calories: 78)

      # Create IngredientDish
      IngredientDish.create!(dish: @omelette, ingredient: @egg)

      visit "/chef/#{@gordon_ramsey.id}"

      click_link("View All Ingredients")

      expect(current_path).to eq("/chef/#{@gordon_ramsey.id}/ingredients")
    end

    it "can list that chefs ingredients" do
      # Create a chef
      @gordon_ramsey = Chef.create!(name: "Gordon Ramsey")

      # Create a dish
      @omelette = @gordon_ramsey.dishes.create!(name: "Omelette", description: "Eggs with your choice of ingredients")

      # Create an ingredient
      @egg = Ingredient.create!(name: "Egg", calories: 78)

      # Create IngredientDish
      IngredientDish.create!(dish: @omelette, ingredient: @egg)

      visit "/chef/#{@gordon_ramsey.id}/ingredients"

      expect(page).to have_content("Egg")
    end
  end
end
