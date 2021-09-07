require 'rails_helper'

RSpec.describe 'chef show page' do
  before :each do
    @chef = Chef.create(name: 'Guy Fieri')
    @dish1 = @chef.dishes.create(name: 'Pizza', description: 'Yummy')
    @dish2 = @chef.dishes.create(name: 'Pizza', description: 'Yummy')
    @dish3 = @chef.dishes.create(name: 'Pizza', description: 'Yummy')
    @dish4 = @chef.dishes.create(name: 'Pizza', description: 'Yummy')
    @pep = Ingredient.create(name: 'Pepperoni', calories: 100)
    @cheese = Ingredient.create(name: 'Cheddar', calories: 80)
    @pineapple = Ingredient.create(name: 'Pineapple', calories: 20)
    @sauce = Ingredient.create(name: 'Sauce', calories: 20)
    @mushroom = Ingredient.create(name: 'Mushroom', calories: 20)
    DishIngredient.create(dish: @dish1, ingredient: @pep)
    DishIngredient.create(dish: @dish2, ingredient: @pep)
    DishIngredient.create(dish: @dish1, ingredient: @cheese)
    DishIngredient.create(dish: @dish2, ingredient: @cheese)
    DishIngredient.create(dish: @dish1, ingredient: @pep)
    DishIngredient.create(dish: @dish2, ingredient: @pep)
    DishIngredient.create(dish: @dish3, ingredient: @pep)
    DishIngredient.create(dish: @dish4, ingredient: @pep)
    DishIngredient.create(dish: @dish1, ingredient: @cheese)
    DishIngredient.create(dish: @dish2, ingredient: @cheese)
    DishIngredient.create(dish: @dish3, ingredient: @cheese)
    DishIngredient.create(dish: @dish1, ingredient: @pineapple)
    DishIngredient.create(dish: @dish2, ingredient: @pineapple)
    DishIngredient.create(dish: @dish1, ingredient: @sauce)

    visit "/chefs/#{@chef.id}"
  end

  it 'shows the chef on show page' do
    expect(page).to have_content(@chef.name)
  end

  it 'has a link to view all of chefs ingredients' do
    click_link('All Ingredients')

    expect(current_path).to eq("/chefs/#{@chef.id}/ingredients")
    expect(page).to have_content(@pep.name)
    expect(page).to have_content(@cheese.name)
    expect(page).to have_content(@pineapple.name)

  end

  it 'shows the 3 most popular ingredients' do

    expect(page).to have_content(@pep.name)
    expect(page).to have_content(@cheese.name)
    expect(page).to have_content(@pineapple.name)
    expect(page).to_not have_content(@sauce.name)
    expect(page).to_not have_content(@mushroom.name)
  end
end
