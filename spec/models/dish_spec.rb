require 'rails_helper'

RSpec.describe Dish do
  before :each do
    @chef = Chef.create!(name: "Chef Remy")
    @dish = @chef.dishes.create!(name: "Pasta", description: "Meatball pasta")

    @ingredient1 = @dish.ingredients.create!(name: "Pasta", calories: 110)
    @ingredient2 = @dish.ingredients.create!(name: "Meatball", calories: 90)
  end

  describe 'relationships' do
    it { should belong_to(:chef) }
  end

  # describe "#methods" do
  #   it "can calculate the sum of all ingredients in a dish" do
  #     expect(Dish.total_calories_count).to eq(200)
  #   end
  # end
end
