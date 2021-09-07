require 'rails_helper'

RSpec.describe Chef do
  describe 'relationships' do
    it { should have_many(:dishes) }
  end

  describe 'instance method' do
    before(:each) do
      @chef = Chef.create!(name: "Chef Khoi")
      @pbj = @chef.dishes.create!(name: 'Peanut Butter and Jelly Sammich', description: 'Award winning PBJ LMAO')
      @grilled_cheese = @chef.dishes.create!(name: "Grilled Cheese Sammich", description: "Don't order this")
      @cheese = Ingredient.create!(name: 'Mozeralla', calories: 78)
      @bread = Ingredient.create!(name: 'White Bread', calories: 79)
      @pb = Ingredient.create!(name: 'Peanut Butter', calories: 188)
      @j = Ingredient.create!(name: 'Jelly', calories: 50)
      DishIngredient.create!(dish: @pbj, ingredient: @bread)
      DishIngredient.create!(dish: @pbj, ingredient: @pb)
      DishIngredient.create!(dish: @pbj, ingredient: @j)
      DishIngredient.create!(dish: @grilled_cheese, ingredient: @cheese)
      DishIngredient.create!(dish: @grilled_cheese, ingredient: @bread)
    end

    it '#ingredients' do
      expect(@chef.ingredients).to eq([@bread, @pb, @j, @cheese])
    end
  end
end
