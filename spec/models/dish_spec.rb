require 'rails_helper'

RSpec.describe Dish do
  describe 'relationships' do
    it { should belong_to(:chef) }
    it {should have_many(:dish_ingredients)}
    it {should have_many(:ingredients).through(:dish_ingredients)}
  end

  describe 'instance methods' do
    describe '#total_calories' do
      it 'calculates total calories for a dish' do
        expect(@dish1.total_calories).to eq(600)
      end
    end
end
