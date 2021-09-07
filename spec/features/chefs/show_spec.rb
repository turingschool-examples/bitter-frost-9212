require 'rails_helper'

RSpec.describe 'Chef Show Page' do
  describe 'display chef attributes' do
    it 'shows the chefs name' do
      chef = Chef.create!(name: 'Chef Remy')

      visit chef_path(chef)

      expect(page).to have_content('Chef Remy')
      expect(page).to have_content(chef.name)
    end

    it 'has a link to the ingredients the chef uses' do
      chef = Chef.create!(name: 'Chef Remy')
      dish = Dish.create!(name: 'Pasta Al Dente', description: 'Fresh pasta with your favorite sauce', chef_id: chef.id)
      ingredient1 = Ingredient.create!( name: 'Mozzarella', calories: 78)
      ingredient2 = Ingredient.create!( name: 'Basil', calories: 8)

      dish.ingredients << ingredient1
      dish.ingredients << ingredient2

      visit chef_path(chef)

      expect(page).to have_link('View all ingredients')

      click_link 'View all ingredients'
      expect(current_path).to eq("/chefs/#{chef.id}/ingredients")
    end
  end
end
