require 'rails_helper'

RSpec.describe Chef do
  describe 'relationships' do
    it { should have_many(:dishes) }
  end

  describe 'ingredients' do
    let!(:chef) { Chef.create!(name: 'Gordon Ramsey') }

    let!(:dish) { Dish.create!(name: 'Pasta', description: 'Pasta and sauce', chef_id: chef.id) }
    let(:noodles) { Ingredient.create!(name: 'Noodles', calories: 35) }
    let(:sauce) { Ingredient.create!(name: 'Sauce', calories: 75) }

    let!(:dish2) { Dish.create!(name: 'Carroty Chicken', description: 'Chicken and carrots in sauce', chef_id: chef.id) }
    let(:chicken) { Ingredient.create!(name: 'Chicken', calories: 123) }
    let(:carrots) { Ingredient.create!(name: 'Carrots', calories: 45) }

    let(:dish3) { Dish.create!(name: 'Chicken noodle soup', description: 'Chicken noodle soup', chef_id: chef.id) }

    let(:dish4) { Dish.create!(name: 'Potatoe soup', description: 'Potatoes in sauce', chef_id: chef.id) }
    let(:potatoe) { Ingredient.create!(name: 'Potatoe', calories: 111111) }

    before :each do
      dish.ingredients << noodles
      dish.ingredients << sauce

      dish2.ingredients << chicken
      dish2.ingredients << carrots
      dish2.ingredients << sauce
    end

    it 'has a list of unique ingredients' do
      expect(chef.ingredients).to eq([noodles, sauce, chicken, carrots])
    end

    it 'has the 3 most popular ingredients' do
      dish3.ingredients << chicken
      dish3.ingredients << noodles

      dish4.ingredients << potatoe
      dish4.ingredients << sauce

      expect(chef.three_most_popular_ingredients).to eq([sauce, noodles, chicken])
    end
  end
end
