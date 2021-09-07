require 'rails_helper'

RSpec.describe 'Dishes Show Page' do
  before :each do
    @chef1 = Chef.create!(name: "kevin")
    @dish1 = @chef1.dishes.create!(name: "Lasagna", description: "Delicious")
    @ingredient1 = Ingredient.create!(name: "Cheese", calories: 100)
    @ingredient2 = Ingredient.create!(name: "Milk", calories: 75)
    @dish_ing1 = DishIngredient.create!(dish_id: @dish1.id, ingredient_id: @ingredient1.id)
    @dish_ing2 = DishIngredient.create!(dish_id: @dish1.id, ingredient_id: @ingredient2.id)
  end

    describe 'show page' do
      it "shows a dishes name and description" do
        visit "/dishes/#{@dish1.id}"

        expect(page).to have_content(@dish1.name)
        expect(page).to have_content(@dish1.description)
      end

      it "shows a dishes ingredients" do
        visit "/dishes/#{@dish1.id}"

        expect(page).to have_content(@ingredient1.name)
        expect(page).to have_content(@ingredient2.name)
      end

      it "shows a dishes chef" do
        visit "/dishes/#{@dish1.id}"

        expect(page).to have_content(@chef1.name)
      end

      it "shows a dishes total calory count" do
        visit "/dishes/#{@dish1.id}"
        save_and_open_page
        expect(page).to have_content(175)
      end
    end
end
