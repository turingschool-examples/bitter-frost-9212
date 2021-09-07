require 'rails_helper'

RSpec.describe Dish do
  describe 'relationships' do
    it { should belong_to(:chef) }
    it { should have_many(:dish_ingredients)}
    it {should have_many(:ingredients).through(:dish_ingredients)}
  end

  it 'calculates total calories' do
    @chef = Chef.create!(name:"Gordon")
    @dish_1 = Dish.create!(name:"Lasagna", description:"layered pasta dish", chef_id: @chef.id)

    @ingredient_1 = Ingredient.create!(name:"Mozzarella", calories: 200)
    @ingredient_2 = Ingredient.create!(name:"Ricotta", calories: 500)
    @ingredient_3 = Ingredient.create!(name:"Beef", calories: 700)
    @ingredient_4 = Ingredient.create!(name:"Lasagna Noodles", calories: 250)

    @dish_ing_1 = DishIngredient.create!(dish: @dish_1, ingredient: @ingredient_1)
    @dish_ing_2 = DishIngredient.create!(dish: @dish_1, ingredient: @ingredient_2)
    @dish_ing_3 = DishIngredient.create!(dish: @dish_1, ingredient: @ingredient_3)
    @dish_ing_4 = DishIngredient.create!(dish: @dish_1, ingredient: @ingredient_4)

    expect(@dish_1.total_calories).to eq(1650)
  end
end
