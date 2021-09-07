require "rails_helper"

RSpec.describe "Dish Show Page" do
  before :each do
    @chef = Chef.create!(name: "Chef Remy")
    @dish = @chef.dishes.create!(name: "Pasta", description: "Meatball pasta")

    @ingredient1 = @dish.ingredients.create!(name: "Pasta", calories: 110)
    @ingredient2 = @dish.ingredients.create!(name: "Meatball", calories: 90)
  end

  describe "Story 1" do
    it "can display a dish's attributes" do
      visit "/dishes/#{@dish.id}"

      expect(page).to have_content("Pasta")
      expect(page).to have_content("Meatball pasta")
      expect(page).to have_content("Pasta")
      expect(page).to have_content("Meatball")
      expect(page).to have_content("Chef Remy")
    end
  end

  describe "Story 2" do
    it "can display a dish's attributes" do
      visit "/dishes/#{@dish.id}"

      expect(page).to have_content(@ingredient1.calories + @ingredient2.calories)
    end
  end
end
