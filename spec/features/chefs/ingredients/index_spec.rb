require 'rails_helper'

RSpec.describe 'Chef ingredients index page' do
   before :each do
     @chef = Chef.create!(name:"Gordon")
     @dish_1 = Dish.create!(name:"Lasagna", description:"layered pasta dish", chef_id: @chef.id)

     @ingredient_1 = Ingredient.create!(name:"Mozzarella", calories: 200)
     @ingredient_2 = Ingredient.create!(name:"Ricotta", calories: 500)
     @ingredient_3 = Ingredient.create!(name:"Beef", calories: 700)
     @ingredient_4 = Ingredient.create!(name:"Lasagna Noodles", calories: 250)

     @dish_ing_1 = DishIngredient.create!(dish: @dish_1, ingredient: @ingredient_1)
     @dish_ing_2 = DishIngredient.create!(dish: @dish_1, ingredient: @ingredient_2)
     @dish_ing_3 = DishIngredient.create!(dish: @dish_1, ingredient: @ingredient_3)
     @dish_ing_4 = DishIngredient.create!(dish: @dish_1, ingredient: @ingredient_4)
   end

   it 'shows the chef name' do
     visit "/chefs/#{@chef.id}/ingredients"

     expect(page).to have_content(@chef.name)
   end

   it 'lists the name of all ingredients the chef uses' do
     visit "/chefs/#{@chef.id}/ingredients"

     expect(page).to have_content(@ingredient_1.name)
     expect(page).to have_content(@ingredient_2.name)
     expect(page).to have_content(@ingredient_3.name)
     expect(page).to have_content(@ingredient_4.name)
   end
end
