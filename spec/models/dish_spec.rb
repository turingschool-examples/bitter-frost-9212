require 'rails_helper'

RSpec.describe Dish do
  describe 'relationships' do
    it { should belong_to(:chef) }
    it {should have_many :dish_ingredients}
    it {should have_many(:ingredients).through(:dish_ingredients)}
  end

  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end

  describe 'instance methods' do

    before :each do
      @remy = Chef.create!(name: "Remy")

      @pizza = @remy.dishes.create!(name: "Pizza", description: "Veggie supreme")
      @imagine = @remy.dishes.create!(name: "Imaginary Ice Cream", description: "Ice cream in your mind")

      @sauce = @pizza.ingredients.create!(name: "Pizza Sauce", calories: "50")
      @dough = @pizza.ingredients.create!(name: "Pizza Dough", calories: "100")
      @cheese = @pizza.ingredients.create!(name: "Vegan Cheese", calories: "200")
      @olives = @pizza.ingredients.create!(name: "Olives", calories: "20")
    end

    describe '.cal_count' do
      it "totals the calories for a dish" do
        expect(@pizza.cal_count).to eq(370)
        expect(@imagine.cal_count).to eq(0)
      end
    end
  end
end
