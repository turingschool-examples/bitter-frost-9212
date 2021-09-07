require 'rails_helper'

RSpec.describe 'show page' do
  before :each do
    @chef = Chef.create!(name: "Chef Remy")
    @spag = @chef.dishes.create!(name: "Spaghetti and Meatballs", description: "Spaghetti noodles topped with marinara and meatballs")
    @lob_rav = @chef.dishes.create!(name: "Lobster Ravioloi", description: "Lobster filled ravioli in a cream sauce")
    @marinara = Ingredient.create!(name: "Marinara Sauce", calories: 80)
    @spaghetti = Ingredient.create!(name: "Spaghetti Noodles", calories: 250)
    @meatballs = Ingredient.create!(name: "Meatballs", calories: 250)
    @ravioli = Ingredient.create!(name: "Lobster raviolois", calories: 400)
    @cream_sauce = Ingredient.create!(name: "Cream sauce", calories: 325)
    DishIngredient.create!(dish: @spag, ingredient: @marinara)
    DishIngredient.create!(dish: @spag, ingredient: @spaghetti)
    DishIngredient.create!(dish: @spag, ingredient: @meatballs)
    DishIngredient.create!(dish: @lob_rav, ingredient: @ravioli)
    DishIngredient.create!(dish: @lob_rav, ingredient: @cream_sauce)
  end

  it 'has name of chef, link to all ingredients' do
    visit "/chefs/#{@chef.id}"
    save_and_open_page
    expect(page).to have_content(@chef.name)
    expect(page).to have_link("See All Chef's Ingredients")
    click_on "See All Chef's Ingredients"
    expect(current_path).to eq("/chefs/#{@chef.id}/ingredients")
  end
end
