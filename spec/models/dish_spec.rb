require 'rails_helper'

RSpec.describe Dish do
  describe 'relationships' do
    it { should belong_to(:chef) }
    it { should have_many(:ingredients).through(:dish_ingredients)}
  end
  before :each do
    @chef = Chef.create!(name: "Me")
    @dish_1 = @chef.dishes.create!(name: "chkn parm", description: "mildly delicious")
    # @dish_2 = Dish.create!(name: "pad thai", description: "actually delicious", chef: @chef.id)
    # @dish_3 = Dish.create!(name: "soup of the day", description: "whatever the chef has in the kitchen", chef: @chef.id)
    # @dish_4 = Dish.create!(name: "salad", description: "it's a salad", chef: @chef.id)
    @ingred_1 = Ingredient.create!(name: "chicken", calories: 80)
    @ingred_2 = Ingredient.create!(name: "cheese", calories: 100)
    # @ingred_3 = Ingredient.create!(name: "letuce", calories: 7)
    # @ingred_4 = Ingredient.create!(name: "carrots", calories: 15)
    # @ingred_5 = Ingredient.create!(name: "cucumber", calories: 10)
    # @ingred_6 = Ingredient.create!(name: "tofu", calories: 45)
    DishIngredient.create!(dish: @dish_1, ingredient: @ingred_1)
    DishIngredient.create!(dish: @dish_1, ingredient: @ingred_2)
  end

  it 'has chef names' do
    expect(@dish_1.chef_name).to eq("Me")
  end

  it 'has calorie sum' do
    expect(@dish_1.cal_sum).to eq(180)
  end
end
