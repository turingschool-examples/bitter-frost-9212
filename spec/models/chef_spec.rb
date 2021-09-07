require 'rails_helper'

RSpec.describe Chef do
  describe 'relationships' do
    it { should have_many(:dishes) }
  end

  describe 'attributes' do
    it "has a name" do
      chef1 = Chef.create!(name: "kevin")

      expect(chef1.name).to eq("kevin")
    end
  end

  it "finds all ingredients" do
    @chef1 = Chef.create!(name: "kevin")
    @dish1 = @chef1.dishes.create!(name: "Lasagna", description: "Delicious")
    @ingredient1 = Ingredient.create!(name: "Cheese", calories: 100)
    @ingredient2 = Ingredient.create!(name: "Milk", calories: 75)
    @dish_ing1 = DishIngredient.create!(dish_id: @dish1.id, ingredient_id: @ingredient1.id)
    @dish_ing2 = DishIngredient.create!(dish_id: @dish1.id, ingredient_id: @ingredient2.id)

    expect(@chef1.find_ingredients).to eq([@ingredient1, @ingredient2])
  end
end
