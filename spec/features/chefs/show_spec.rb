require "rails_helper"

RSpec.describe "Chef Show Page"do
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
     it "can display that chef's name and link to all unique ingredients" do
       visit "/chefs/#{@chef.id}"

       expect(page).to have_content("Chef Remy")
       expect(page).to have_link(@dish.name)
       expect(page).to have_link("All Ingredients")

       click_on "All Ingredients"

       expect(current_path).to eq("/chefs/#{@chef.id}/ingredients")
       expect(page).to have_content(@pasta.name)
       expect(page).to have_content(@meatball.name)
       expect(page).to have_content(@sauce.name)
     end
   end
 end
