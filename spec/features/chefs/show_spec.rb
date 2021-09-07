require 'rails_helper'

RSpec.describe 'chef show page' do
  before :each do
    @chef = Chef.create!(name: "Chef Remi")
    @dish_1 = @chef.dishes.create!(name: "Pasta Al Dente", description: "Fresh pasta with your favorite sauce")
    @ingredient_1 = Ingredient.create!(name: "Mozzarella", calories: 70)
    @ingredient_2 = Ingredient.create!(name: "Rigatoni", calories: 10)
    @dish_1.ingredients << @ingredient_1
    @dish_1.ingredients << @ingredient_2
  end

  it 'shows the chef attributes and link to ingredients they use' do
    visit "/chefs/#{@chef.id}"
    expect(page).to have_content(@chef.name)
    expect(page).to have_link("view all ingredients")
    click_link("view all ingredients")
    expect(current_path).to eq("/chefs/#{@chef.id}/ingredients")
  end
end
