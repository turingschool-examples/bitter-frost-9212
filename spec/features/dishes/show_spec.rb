require 'rails_helper'

RSpec.describe 'Dish show page' do
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

  it 'shows the dishes name' do
    visit "/dishes/#{@dish_1.id}"

    expect(page).to have_content(@dish_1.name)
  end

  it 'shows the dishes description' do
    visit "/dishes/#{@dish_1.id}"

    expect(page).to have_content(@dish_1.description)
  end

  it 'lists the dish ingredients' do
    visit "/dishes/#{@dish_1.id}"

    expect(page).to have_content(@ingredient_1.name)
    expect(page).to have_content(@ingredient_2.name)
    expect(page).to have_content(@ingredient_3.name)
    expect(page).to have_content(@ingredient_4.name)
  end

  it 'shows the chef name' do
    visit "/dishes/#{@dish_1.id}"
    expect(page).to have_content(@chef.name)
  end

  it 'shows the total calorie count for a dish' do
    visit "/dishes/#{@dish_1.id}"
    
    expect(page).to have_content(1650)
  end
end
