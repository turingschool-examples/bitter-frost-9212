require "rails_helper"

# Story 1 of 3
# As a visitor
# When I visit a dish's show page
# I see the dish’s name and description
# And I see a list of ingredients for that dish
# And I see the chef's name

RSpec.describe "Dish Show Page" do
  before :each do
    @chef = Chef.create!(name: "Chef Remy")
    @dish = @chef.dishes.create!(name: "Pasta", description: "Meatball pasta")

    @ingredient1 = @dish.ingredients.create!(name: "Pasta")
    @ingredient2 = @dish.ingredients.create!(name: "Meatball")

  end

  describe "Story 1" do
    it "can display a dish's attributes" do
      visit "/dishes/#{@dish.id}"

      expect(page).to have_content(@dish.name)
      expect(page).to have_content("Meatball pasta")
      expect(page).to have_content("Pasta")
      expect(page).to have_content("Meatball")
      expect(page).to have_content("Chef Remy")
    end
  end
end
