require 'rails_helper'

RSpec.describe 'index page for dishes' do

  it 'shows all dishes' do
  chef = Chef.create!(name: "John")
  dish = chef.dishes.create!(name: "Lasagna", description: "Italian meal")

  visit '/dishes'

  expect(page).to have_content("Lasagna")
  end 
end
