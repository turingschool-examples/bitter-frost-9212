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

      visit chef_path(chef)

      expect(page).to have_link('View all ingredients')

      click_link 'View all ingredients'

      expect(current_path).to eq()
    end
  end
end
