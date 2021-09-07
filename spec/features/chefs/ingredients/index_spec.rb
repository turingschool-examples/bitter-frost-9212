require 'rails_helper'

RSpec.describe 'a chefs show page' do

  before :each do
    @remy = Chef.create!(name: "Remy")

    @pizza = @remy.dishes.create!(name: "Pizza", description: "Veggie supreme")
    @mac = @remy.dishes.create!(name: "Macaroni & Cheese", description: "Veggie supreme")

    @sauce = @pizza.ingredients.create!(name: "Pizza Sauce", calories: "50")
    @dough = @pizza.ingredients.create!(name: "Pizza Dough", calories: "100")
    @cheese = @pizza.ingredients.create!(name: "Vegan Cheese", calories: "200")
    @olives = @pizza.ingredients.create!(name: "Olives", calories: "20")

    @pasta = @mac.ingredients.create!(name: "Pasta", calories: 200)
    @mac.ingredients << @cheese
  end

  it "displays the chef's name and all unique ingredients" do
    visit "/chefs/#{@remy.id}/ingredients"

    expect(page).to have_content("Chef Remy's Ingredients")

    expect(page).to have_content(@sauce.name)
    expect(page).to have_content(@dough.name)
    expect(page).to have_content(@cheese.name, count: 1)
    expect(page).to have_content(@olives.name)
    expect(page).to have_content(@pasta.name)
  end
end
