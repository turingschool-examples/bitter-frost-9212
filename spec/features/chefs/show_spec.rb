require "rails_helper"

RSpec.describe "Chef Show Page"do
   before :each do
     @chef = Chef.create!(name: "Chef Remy")
     @dish = @chef.dishes.create!(name: "Pasta", description: "Meatball pasta")

     @ingredient1 = @dish.ingredients.create!(name: "Pasta", calories: 110)
     @ingredient2 = @dish.ingredients.create!(name: "Meatball", calories: 90)
     @ingredient3 = @dish.ingredients.create!(name: "Pasta", calories: 110)
   end

   describe "Story 3" do
     it "can display that chef's name and link to all unique ingredients" do
       visit "/chefs/#{@chef.id}"

       expect(page).to have_content("Chef Remy")
       expect(page).to have_link(@dish.name)
       expect(page).to have_link("All Ingredients")

       click_on "All Ingredients"

       expect(current_path).to eq("/chefs/#{@chef.id}/ingredients")
       expect(page).to have_content(@ingredients1)
       expect(page).to have_content(@ingredients2)
     end
   end
 end
