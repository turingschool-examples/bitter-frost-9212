require 'rails_helper'

describe 'chef show page' do
  before(:each) do
    @chef = Chef.create!(name: "Chef Khoi")
    @pbj = @chef.dishes.create!(name: 'Peanut Butter and Jelly Sammich', description: 'Award winning PBJ LMAO')
    @grilled_cheese = @chef.dishes.create!(name: "Grilled Cheese Sammich", description: "Don't order this")
    @cheese = Ingredient.create!(name: 'Mozeralla', calories: 78)
    @bread = Ingredient.create!(name: 'White Bread', calories: 79)
    @pb = Ingredient.create!(name: 'Peanut Butter', calories: 188)
    @j = Ingredient.create!(name: 'Jelly', calories: 50)
    DishIngredient.create!(dish: @pbj, ingredient: @bread)
    DishIngredient.create!(dish: @pbj, ingredient: @pb)
    DishIngredient.create!(dish: @pbj, ingredient: @j)
    DishIngredient.create!(dish: @grilled_cheese, ingredient: @cheese)
    DishIngredient.create!(dish: @grilled_cheese, ingredient: @bread)
  end
  
  it 'has the name of the chef' do
    visit "/chefs/#{@chef.id}"

    expect(page).to have_content(@chef.name)
  end

  it 'has a link to view unique ingredients the chef uses in their dishes' do
    visit "/chefs/#{@chef.id}"

    expect(page).to have_link("Ingredients")

    click_link "Ingredients"
    save_and_open_page
    expect(page).to have_content(@cheese.name)
    expect(page).to have_content(@bread.name)
    expect(page).to have_content(@pb.name)
    expect(page).to have_content(@j.name)
  end
end