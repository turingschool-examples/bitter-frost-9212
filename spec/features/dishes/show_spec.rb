require 'rails_helper'

describe 'dish show page' do
  before(:each) do
    @chef = Chef.create!(name: 'Chef Khoi')
    @dish = @chef.dishes.create!(name: 'Pizza', description: 'Nothing special, really')
    @cheese = Ingredient.create!(name: 'Mozeralla', calories: 78)
    @pepperoni = Ingredient.create!(name: 'Pepperoni', calories: 90)
    DishIngredient.create!(dish: @dish, ingredient: @cheese)
    DishIngredient.create!(dish: @dish, ingredient: @pepperoni)
  end
  
  it 'has a its name, description, ingredients, and chef' do
    visit "/dishes/#{@dish.id}"

    expect(page).to have_content(@dish.name)
    expect(page).to have_content(@dish.description)
    expect(page).to have_content(@cheese.name)
    expect(page).to have_content(@pepperoni.name)
    expect(page).to have_content(@chef.name)
  end
end