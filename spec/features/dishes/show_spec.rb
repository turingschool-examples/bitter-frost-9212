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
  end
end
