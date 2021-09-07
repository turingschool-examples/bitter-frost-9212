require 'rails_helper'

RSpec.describe 'the dish show page' do
  it 'shows the dish name, description, and ingredients, and chef' do
    chef = Chef.create(name: 'Jamison')
    dish = Dish.create(name: 'Spaghetti', description: 'Pasta', chef_id: "#{chef.id}")
    ing1 = Ingredient.create(name: 'noodles', calories: 100, dish_id: "#{dish.id}")
    ing2 = Ingredient.create(name: 'tomatoes', calories: 30, dish_id: "#{dish.id}")

    visit "/dishes/#{dish.id}"

    expect(current_path).to eq("/dishes/#{dish.id}")

    expect(page).to have_content("Spaghetti")
    expect(page).to have_content("Pasta")
    expect(page).to have_content("noodles")
    expect(page).to have_content("tomatoes")
    expect(page).to have_content("Jamison")

  end

end
