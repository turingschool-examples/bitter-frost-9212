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
    it { should have_many(:ingredients) }
  end

end
