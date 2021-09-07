require 'rails_helper'

RSpec.describe 'dish show page' do
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

  it 'displays the name of the dish, description, list of all ingredients, and the chef name' do
    visit "/dishes/#{@dish1.id}"

    expect(page).to have_content(@dish1.name)
    expect(page).to have_content(@dish1.description)
    expect(page).to have_content(@chef1.name)
    expect(page).to have_content(@ingredient1.name)
    expect(page).to have_content(@ingredient2.name)
    expect(page).to have_content(@ingredient3.name)
  end

  it 'calculates and displays the number of calories for the dish' do
    visit "/dishes/#{@dish1.id}"
    save_and_open_page
    
    expect(page).to have_content(600)
  end
end
