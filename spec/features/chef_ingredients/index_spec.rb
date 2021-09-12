require "rails_helper"

RSpec.describe "Chef Ingredient Page" do
  before :each do
    @chef = Chef.create!(name: "Chef Remy")
    @dish = @chef.dishes.create!(name: "Pasta", description: "Meatball pasta")

    @pasta = Ingredient.create!(name: "Pasta", calories: 110)
    @meatball = Ingredient.create!(name: "Meatball", calories: 90)
    @sauce = Ingredient.create!(name: "Sauce", calories: 210)

    @ice_cream = Ingredient.create!(name: "Ice Cream", calories: 350)

    DishIngredient.create!(dish: @dish, ingredient: @pasta)
    DishIngredient.create!(dish: @dish, ingredient: @meatball)
    DishIngredient.create!(dish: @dish, ingredient: @sauce)
  end

  describe "Story 3" do
    it "can show that chef's ingredients with link" do
      visit "/chefs/#{@chef.id}/ingredients"

      expect(page).to have_link(@pasta.name)
      expect(page).to have_link(@meatball.name)
      expect(page).to have_link(@sauce.name)
    end
  end
end
