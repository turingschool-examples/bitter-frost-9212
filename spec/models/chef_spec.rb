require 'rails_helper'

RSpec.describe Chef do
  before(:each) do
    @chef_1 = Chef.create!(name: "Ryan Gatorman")
    @dish_1 = Dish.create!(name: "Chilli of Forgiveness", description: "White bean turkey chilli with fall vegetables", chef: @chef_1)
    @dish_2 = Dish.create!(name: "Breakfast Bowl", description: "Easy breakfast bowl to start any day.", chef: @chef_1)
    @dish_3 = Dish.create!(name: "Egg Roll in a Bowl", description: "Tasty Asian inspired lunch bowl", chef: @chef_1)
    @ingredient_1 = Ingredient.create!(name: "Ground Turkey", calories: 90)
    @ingredient_2 = Ingredient.create!(name: "Butternut Squash", calories: 75)
    @ingredient_3 = Ingredient.create!(name: "Kale", calories: 50)
    @ingredient_4 = Ingredient.create!(name: "Egg", calories: 50)
    @ingredient_5 = Ingredient.create!(name: "Chorizo", calories: 120)
    @ingredient_6 = Ingredient.create!(name: "Rice", calories: 90)
    @dish_1.ingredients << @ingredient_1
    @dish_1.ingredients << @ingredient_2
    @dish_1.ingredients << @ingredient_3
    @dish_2.ingredients << @ingredient_3
    @dish_2.ingredients << @ingredient_4
    @dish_2.ingredients << @ingredient_5
    @dish_3.ingredients << @ingredient_1
    @dish_3.ingredients << @ingredient_3
    @dish_3.ingredients << @ingredient_4
    @dish_3.ingredients << @ingredient_6
  end
  describe 'relationships' do
    it { should have_many(:dishes) }
  end

  describe 'instance methods' do
    it 'has list of all ingredients' do
      expect(@chef_1.all_ing).to eq([@ingredient_1, @ingredient_2, @ingredient_3, @ingredient_3, @ingredient_4, @ingredient_5, @ingredient_1, @ingredient_3, @ingredient_4, @ingredient_6])
    end

    it 'has list of unique ingredients' do
      expect(@chef_1.all_ing_uniq).to eq([@ingredient_1, @ingredient_2, @ingredient_3, @ingredient_4, @ingredient_5, @ingredient_6])
    end

    it 'has most popular ingredients' do
      expect(@chef_1.popular_ing).to eq([@ingredient_3, @ingredient_4, @ingredient_1])
    end
  end
end
