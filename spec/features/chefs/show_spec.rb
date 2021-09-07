# When I visit a chef's show page
# I see the name of that chef
# And I see a link to view a list of all ingredients that this chef uses in their dishes
# When I click on that link
# I'm taken to a chef's ingredient index page
# and I can see a unique list of names of all the ingredients that this chef uses
 require "rails_helper"

 RSpec.describe "Chef Show Page"do
   before :each do
     @chef = Chef.create!(name: "Chef Remy")
     @dish = @chef.dishes.create!(name: "Pasta", description: "Meatball pasta")

     @ingredient1 = @dish.ingredients.create!(name: "Pasta", calories: 110)
     @ingredient2 = @dish.ingredients.create!(name: "Meatball", calories: 90)

   end

   describe "Story 3" do
     it "can display that chef's name" do
       visit "/chefs/#{@chef.id}"

       expect(page).to have_content("Chef Remy")
       expect(page).to have_link(@dish.name)
       expect(page).to have_link("All Ingredients")

       click_on "All Ingredients"

       expect(page).to have_content(@ingredients1)
       expect(page).to have_content(@ingredients1)
     end
   end
 end
