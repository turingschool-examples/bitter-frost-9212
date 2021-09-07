require 'rails_helper'

RSpec.describe 'a chefs show page' do

  before :each do
    @remy = Chef.create!(name: "Remy")

    @veg_pizza = @remy.dishes.create!(name: "Pizza", description: "Veggie supreme")
    @marg_pizza = @remy.dishes.create!(name: "Pizza", description: "Margherita")
    @mac = @remy.dishes.create!(name: "Macaroni & Cheese", description: "Veggie supreme")

    @sauce = @veg_pizza.ingredients.create!(name: "Pizza Sauce", calories: "50")
    @dough = @veg_pizza.ingredients.create!(name: "Pizza Dough", calories: "100")
    @cheese = @veg_pizza.ingredients.create!(name: "Vegan Cheese", calories: "200")
    @olives = @veg_pizza.ingredients.create!(name: "Olives", calories: "20")

    @pasta = @mac.ingredients.create!(name: "Pasta", calories: 200)
    @mac.ingredients << @cheese
    @marg_pizza.ingredients << @sauce
    @marg_pizza.ingredients << @dough
    @marg_pizza.ingredients << @cheese

  end

  it "shows the chef's attributes" do
    visit "/chefs/#{@remy.id}"

    within('#attributes') do
      expect(page).to have_content(@remy.name)
    end
  end

  it "links to the chef's ingredients" do
    visit "/chefs/#{@remy.id}"

    within('#ingredients') do
      expect(page).to have_link("View Chef's Ingredients")
      click_link("View Chef's Ingredients")
    end
    expect(current_path).to eq("/chefs/#{@remy.id}/ingredients")
  end

  it "shows the 3 most popular ingredients" do
    visit "/chefs/#{@remy.id}"

    within('#popular_ingred') do
      expect(page).to have_content("Most Popular Ingredients")
      expect(page).to have_content(@cheese.name)
      expect(page).to have_content(@sauce.name)
      expect(page).to have_content(@dough.name)
    end
  end
end
