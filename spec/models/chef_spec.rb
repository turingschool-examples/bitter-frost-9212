require 'rails_helper'

RSpec.describe Chef do
  describe 'relationships' do
    it { should have_many(:dishes) }
  end

  describe 'instance methods' do

    before :each do
      @remy = Chef.create!(name: "Remy")

      @pizza = @remy.dishes.create!(name: "Pizza", description: "Veggie supreme")
      @mac = @remy.dishes.create!(name: "Macaroni & Cheese", description: "Veggie supreme")

      @sauce = @pizza.ingredients.create!(name: "Pizza Sauce", calories: "50")
      @dough = @pizza.ingredients.create!(name: "Pizza Dough", calories: "100")
      @cheese = @pizza.ingredients.create!(name: "Vegan Cheese", calories: "200")
      @olives = @pizza.ingredients.create!(name: "Olives", calories: "20")

      @pasta = @mac.ingredients.create!(name: "Pasta", calories: 200)
      @mac.ingredients << @cheese
    end

    describe '.ingredients' do
      it "returns a list of unique ingredients a chef uses" do
        expect(@remy.ingredients).to eq([@sauce.name, @dough.name, @cheese.name, @olives.name, @pasta.name])
      end
    end
  end
end
