require 'rails_helper'

RSpec.describe 'Dish Show Page' do
  describe 'display dish attributes' do
    it 'shows a dishes name and description' do
      chef = Chef.create!(name: 'Chef Remy')
      dish = Dish.create!(name: 'Pasta Al Dente', description: 'Fresh pasta with your favorite sauce', chef_id: chef.id)

      visit dish_path(dish)

      expect(page).to have_content(dish.name)
      expect(page).to have_content(dish.description)
    end

    it 'shows a list of the dishes ingredients and chef name' do
      chef = Chef.create!(name: 'Chef Remy')
      dish = Dish.create!(name: 'Pasta Al Dente', description: 'Fresh pasta with your favorite sauce', chef_id: chef.id)
      ingredient1 = Ingredient.create!( name: 'Mozzarella', calories: 78)
      ingredient2 = Ingredient.create!( name: 'Basil', calories: 8)

      dish.ingredients << ingredient1
      dish.ingredients << ingredient2

      visit dish_path(dish)

      expect(page).to have_content('Mozzarella')
      expect(page).to have_content('Basil')
      expect(page).to have_content('Chef Remy')
    end
  end
end
