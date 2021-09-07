require 'rails_helper'

RSpec.describe 'chef show page' do
  before :each do
    @chef1 = Chef.create!(name: "Mose")
    @dish1 = @chef1.dishes.create!(name: "Spaghetti alla Mose", description: "Spaghetti with meatballs and marinara")
    @ingredient1 = Ingredient.create!(name: "Spaghetti noodles", calories: 100)
    @ingredient2 = Ingredient.create!(name: "Beef meatballs", calories: 300)
    @ingredient3 = Ingredient.create!(name: "Marinara Sauce", calories: 200)
    DishIngredient.create(dish_id: @dish1.id, ingredient_id: @ingredient1.id)
    DishIngredient.create(dish_id: @dish1.id, ingredient_id: @ingredient2.id)
    DishIngredient.create(dish_id: @dish1.id, ingredient_id: @ingredient3.id)
  end

  it 'displays the name of the chef and a link to all ingredients the chef uses in their dishes' do
    visit "/chefs/#{@chef1.id}"

    expect(page).to have_content(@chef1.name)
    expect(page).to have_link("List of Their Ingredients")
  end

  it 'takes you to the chefs ingredient index page' do
    visit "/chefs/#{@chef1.id}"

    click_link "List of Their Ingredients"

    expect(current_path).to eq("/chefs/#{@chef1.id}/ingredients")
    expect(page).to have_content(@ingredient1.name)
    expect(page).to have_content(@ingredient2.name)
    expect(page).to have_content(@ingredient3.name)
  end
end
