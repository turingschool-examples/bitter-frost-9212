require "rails_helper"

RSpec.describe "Dish Show Page" do
  before(:each) do
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

  describe "Story 1" do
    it "can display a dish's attributes" do
      visit "/dishes/#{@dish.id}"

      expect(page).to have_content(@dish.name)
      expect(page).to have_content(@dish.description)
    end

    it "can display a dish's ingredients" do
      visit "/dishes/#{@dish.id}"

      expect(page).to have_content(@pasta.name)
      expect(page).to have_content(@meatball.name)
      expect(page).to have_content(@sauce.name)

      expect(page).to have_no_content(@ice_cream.name)
    end

    it "can display a dish's chef's name" do
      visit "/dishes/#{@dish.id}"

      expect(page).to have_content(@dish.chef.name)
    end
  end

  describe "Story 2" do
    it "can display a total calories for a dish" do
      visit "/dishes/#{@dish.id}"

      expect(page).to have_content(@pasta.calories + @meatball.calories + @sauce.calories)
    end
  end
end
