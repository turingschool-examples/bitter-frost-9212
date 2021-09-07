require 'rails_helper'

RSpec.describe Ingredient do
  it { should have_many(:dishes).through(:dish_ingredients) }
  it { should have_many(:dish_ingredients) }

  it 'finds ingredients by chef' do
    chef = Chef.create(name: 'Guy Fieri')
    dish1 = chef.dishes.create(name: 'Pizza', description: 'Yummy')
    dish2 = chef.dishes.create(name: 'Not Pizza', description: 'Not Yummy')
    pep = dish1.ingredients.create(name: 'Pepperoni', calories: 100)
    cheese = dish1.ingredients.create(name: 'Cheddar', calories: 80)
    DishIngredient.create(dish: dish2, ingredient: pep)

    expect(Ingredient.ingredients_by_chef(chef.id)).to eq([pep, cheese])
  end
end
