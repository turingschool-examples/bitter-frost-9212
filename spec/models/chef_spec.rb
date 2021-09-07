require 'rails_helper'

RSpec.describe Chef do
  describe 'relationships' do
    it { should have_many(:dishes) }
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

  describe '.ingredients' do
    it 'lists ingrediets the chef uses' do
      expect(@swedish_chef.ingredients).to eq("noodles, sauce")
      expect(@emeril.ingredients).to eq("bread, meatballs, sauce")
    end
  end
end
