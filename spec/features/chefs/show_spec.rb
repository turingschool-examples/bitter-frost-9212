require 'rails_helper'

RSpec.describe 'chef show page' do
  before :each do
    @chef = Chef.create!(name: "Me")
    @dish_1 = @chef.dishes.create!(name: "chkn parm", description: "mildly delicious")
    # @dish_2 = Dish.create!(name: "pad thai", description: "actually delicious", chef: @chef.id)
    # @dish_3 = Dish.create!(name: "soup of the day", description: "whatever the chef has in the kitchen", chef: @chef.id)
    # @dish_4 = Dish.create!(name: "salad", description: "it's a salad", chef: @chef.id)
    @ingred_1 = Ingredient.create!(name: "chicken", calories: 80)
    @ingred_2 = Ingredient.create!(name: "cheese", calories: 100)
    # @ingred_3 = Ingredient.create!(name: "letuce", calories: 7)
    # @ingred_4 = Ingredient.create!(name: "carrots", calories: 15)
    # @ingred_5 = Ingredient.create!(name: "cucumber", calories: 10)
    # @ingred_6 = Ingredient.create!(name: "tofu", calories: 45)
    DishIngredient.create!(dish: @dish_1, ingredient: @ingred_1)
    DishIngredient.create!(dish: @dish_1, ingredient: @ingred_2)

    visit "/chefs/#{@chef.id}"
  end

  it 'shows chef name' do
    expect(page).to have_content("Me")
  end

  it 'has a link to chefs ingredients' do
    expect(page).to have_link("Ingredients")
    click_on("Ingredients")
    expect(page).to have_current_path("/chefs/#{@chef.id}/ingredients")
    expect(page).to have_content(@ingred_1.name)
    expect(page).to have_content(@ingred_2.name)
  end
end
