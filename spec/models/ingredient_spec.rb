require 'rails_helper'

RSpec.describe Ingredient do
  before :each do
    @chef = Chef.create!(name: "Chef Remy")
    @dish = @chef.dishes.create!(name: "Pasta", description: "Meatball pasta")

    @ingredient1 = Ingredient.create!(name: "Pasta", calories: 110)
    @ingredient2 = Ingredient.create!(name: "Meatball", calories: 90)
    @ingredient3 = Ingredient.create!(name: "Pasta", calories: 110)

    DishIngredient.create!(dish: @dish, ingredient: @ingredient1)
    DishIngredient.create!(dish: @dish, ingredient: @ingredient2)
  end

  describe 'relationships' do
    it { should have_many(:dish_ingredients) }
    it { should have_many(:dishes).through(:dish_ingredients) }
  end

end
