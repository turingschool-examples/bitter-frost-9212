# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Chefs Show Page' do
  before :each do
    @chef1 = Chef.create!(name: 'kevin')
    @dish1 = @chef1.dishes.create!(name: 'Lasagna', description: 'Delicious')
    @ingredient1 = Ingredient.create!(name: 'Cheese', calories: 100)
    @ingredient2 = Ingredient.create!(name: 'Milk', calories: 75)
    @dish_ing1 = DishIngredient.create!(dish_id: @dish1.id, ingredient_id: @ingredient1.id)
    @dish_ing2 = DishIngredient.create!(dish_id: @dish1.id, ingredient_id: @ingredient2.id)
  end

  describe 'chefs show page' do
    it 'shows the name of the chef' do
      visit "/chefs/#{@chef1.id}"

      expect(page).to have_content(@chef1.name)
    end

    it 'shows a link to the ingredients a chef uses' do
      visit "/chefs/#{@chef1.id}"

      expect(page).to have_link('All Used Ingredients')
    end

    it 'allows you to click and redirects you to ingredient index page' do
      visit "/chefs/#{@chef1.id}"
      click_on 'All Used Ingredients'

      expect(current_path).to eq("/chefs/#{@chef1.id}/ingredients")
      expect(page).to have_content('All Used Ingredients')
    end

    it 'shows all unique ingredients on chefs ingredients index page' do
      visit "/chefs/#{@chef1.id}"
      click_on 'All Used Ingredients'

      expect(page).to have_content(@ingredient1.name)
      expect(page).to have_content(@ingredient2.name)
    end
  end
end
