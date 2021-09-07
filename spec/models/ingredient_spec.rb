require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  describe 'relationships' do
    it {should have_many :dish_ingredients}
    it {should have_many(:dishes).through(:dish_ingredients)}
  end

  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :calories}
  end

  describe 'class methods' do

    before :each do
      @remy = Chef.create!(name: "Remy")

      @veg_pizza = @remy.dishes.create!(name: "Pizza", description: "Veggie supreme")
      @marg_pizza = @remy.dishes.create!(name: "Pizza", description: "Margherita")
      @mac = @remy.dishes.create!(name: "Macaroni & Cheese", description: "Veggie supreme")

      @sauce = @veg_pizza.ingredients.create!(name: "Pizza Sauce", calories: "50")
      @dough = @veg_pizza.ingredients.create!(name: "Pizza Dough", calories: "100")
      @cheese = @veg_pizza.ingredients.create!(name: "Vegan Cheese", calories: "200")
      @olives = @veg_pizza.ingredients.create!(name: "Olives", calories: "20")

      @pasta = @mac.ingredients.create!(name: "Pasta", calories: 200)
      @mac.ingredients << @cheese
      @marg_pizza.ingredients << @sauce
      @marg_pizza.ingredients << @dough
      @marg_pizza.ingredients << @cheese

    end

    describe '#for_chef' do
      it "returns a list of unique ingredients a chef uses" do
        expect(Ingredient.for_chef(@remy.id)).to eq([@sauce, @dough, @cheese, @olives, @pasta])
      end
    end

    describe '#most_pop' do
      it "returns the 3 most used ingredients" do
        expect(Ingredient.most_pop(@remy.id)).to eq([@cheese, @sauce, @dough])
      end
    end
  end
end
