require 'rails_helper'

RSpec.describe 'a dishs show page' do

  before :each do
    @remy = Chef.create!(name: "Remy")

    @pizza = @remy.dishes.create!(name: "Pizza", description: "Veggie supreme")

    @sauce = @pizza.ingredients.create!(name: "Pizza Sauce", calories: "50")
    @dough = @pizza.ingredients.create!(name: "Pizza Dough", calories: "100")
    @cheese = @pizza.ingredients.create!(name: "Vegan Cheese", calories: "200")
    @olives = @pizza.ingredients.create!(name: "Olives", calories: "20")
  end

  it "shows the dish's attributes" do
    visit "/dishes/#{@pizza.id}"

    within('#attributes') do
      expect(page).to have_content(@pizza.name)
      expect(page).to have_content(@pizza.description)
    end
  end

  it "shows the dish's ingredients" do
    visit "/dishes/#{@pizza.id}"

    within('#ingredients') do
      expect(page).to have_content(@sauce.name)
      expect(page).to have_content(@dough.name)
      expect(page).to have_content(@cheese.name)
      expect(page).to have_content(@olives.name)
    end
  end

  it "shows the dish's chef" do
    visit "/dishes/#{@pizza.id}"

    within('#chef') do
      expect(page).to have_content(@remy.name)
    end
  end

end
