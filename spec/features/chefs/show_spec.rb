require 'rails_helper'

RSpec.describe 'chef show page' do
  before :each do
    @chef = Chef.create!(name:"Gordon")
    @dish_1 = Dish.create!(name:"Lasagna", description:"layered pasta dish", chef_id: @chef.id)
    @dish_2 = Dish.create!(name:"Pizza", description:"We all know", chef_id: @chef.id)
    @dish_3 = Dish.create!(name:"Chicken Parm", description:"Melted cheese over baked chicken", chef_id: @chef.id)

    @ingredient_1 = Ingredient.create!(name:"Mozzarella", calories: 200)
    @ingredient_2 = Ingredient.create!(name:"Ricotta", calories: 500)
    @ingredient_3 = Ingredient.create!(name:"Beef", calories: 700)
    @ingredient_4 = Ingredient.create!(name:"Lasagna Noodles", calories: 250)
    @ingredient_5 = Ingredient.create!(name:"Pizza Crust", calories: 250)
    @ingredient_6 = Ingredient.create!(name:"Chicken", calories: 250)
    @ingredient_7 = Ingredient.create!(name:"Angel hair", calories: 250)
    @ingredient_8 = Ingredient.create!(name:"Basil", calories: 250)

    #lasagna ingredients
    @dish_ing_1 = DishIngredient.create!(dish: @dish_1, ingredient: @ingredient_1)
    @dish_ing_2 = DishIngredient.create!(dish: @dish_1, ingredient: @ingredient_2)
    @dish_ing_3 = DishIngredient.create!(dish: @dish_1, ingredient: @ingredient_3)
    @dish_ing_4 = DishIngredient.create!(dish: @dish_1, ingredient: @ingredient_4)

    #pizza ingredients
    @dish_ing_5 = DishIngredient.create!(dish: @dish_2, ingredient: @ingredient_1)
    @dish_ing_6 = DishIngredient.create!(dish: @dish_2, ingredient: @ingredient_5)
    @dish_ing_7 = DishIngredient.create!(dish: @dish_2, ingredient: @ingredient_6)
    @dish_ing_8 = DishIngredient.create!(dish: @dish_2, ingredient: @ingredient_8)

    #chicken parm ingredients
    @dish_ing_9 = DishIngredient.create!(dish: @dish_3, ingredient: @ingredient_1)
    @dish_ing_10 = DishIngredient.create!(dish: @dish_3, ingredient: @ingredient_6)
    @dish_ing_11 = DishIngredient.create!(dish: @dish_3, ingredient: @ingredient_7)
    @dish_ing_12 = DishIngredient.create!(dish: @dish_3, ingredient: @ingredient_8)

  end

  it 'shows the chef name' do
    visit "/chefs/#{@chef.id}"
    expect(page).to have_content(@chef.name)
  end

  it 'has a link to chef ingredient index page' do
    visit "/chefs/#{@chef.id}"

    click_link "View Ingredients"
    expect(current_path).to eq("/chefs/#{@chef.id}/ingredients")
  end

  it 'shows the chefs three most_popular ingredients' do
    visit "/chefs/#{@chef.id}"

    expect(page).to have_content(@ingredient_1.name)
    expect(page).to have_content(@ingredient_6.name)
    expect(page).to have_content(@ingredient_8.name)
  end

end
