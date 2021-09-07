require "rails_helper"

RSpec.describe "Chef Ingredient Page" do
  before :each do
    @chef = Chef.create!(name: "Chef Remy")
    @dish = @chef.dishes.create!(name: "Pasta", description: "Meatball pasta")

    @ingredient1 = @dish.ingredients.create!(name: "Pasta", calories: 110)
    @ingredient2 = @dish.ingredients.create!(name: "Meatball", calories: 90)
  end

  describe "Story 3" do
    it "can show that chef's ingredients" do
      visit "/chefs/#{@chef.id}/ingredients"

      expect(page).to have_content(@ingredient1.name)
      expect(page).to have_content(@ingredient2.name)
    end
  end
end
