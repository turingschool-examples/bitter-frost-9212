require 'rails_helper'

RSpec.describe Dish do
  describe 'relationships' do
    it { should belong_to(:chef) }
    it { should have_many(:dish_ingredients) }
    it { should have_many(:ingredients).through(:dish_ingredients) }
  end

  before(:each) do
    @swedish_chef = Chef.create!(name: "Swedish Chef")
    @emeril       = Chef.create!(name: "Emeril Lagassi")

    @spaghetti     = @swedish_chef.dishes.create!(name: "Spaghetti", description: "It's noodles and sauce. What else do you want?!?")
    @meatball_sand = @emeril.dishes.create!(name: "Meatball Sandwich", description: 'Meats and breads. Sauce. Wow!')

    @noodles     = Ingredient.create!(name: "noodles", calories: 300)
    @sauce       = Ingredient.create!(name: "sauce", calories: 150)
    @bread       = Ingredient.create!(name: "bread", calories: 200)
    @meatballs   = Ingredient.create!(name: "meatballs", calories: 400)

    @spaghetti.ingredients << @noodles
    @spaghetti.ingredients << @sauce

    @meatball_sand.ingredients << @bread
    @meatball_sand.ingredients << @meatballs
    @meatball_sand.ingredients << @sauce
  end

  describe '.ingredients_list' do
    it 'lists ingredients' do
      expect(@spaghetti.ingredients_list).to eq("noodles, sauce")
    end
  end

  describe '.calories' do
    it 'totals the calories for the dish' do
      expect(@spaghetti.calories).to eq(450)
      expect(@meatball_sand.calories).to eq(750)
    end
  end
end
