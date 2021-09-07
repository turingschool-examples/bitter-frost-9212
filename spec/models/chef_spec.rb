require 'rails_helper'

RSpec.describe Chef do
  describe 'relationships' do
    it { should have_many(:dishes) }
  end

  it '#all_ingredients' do
    @chef = Chef.create!(name:"Gordon")
    @dish_1 = Dish.create!(name:"Lasagna", description:"layered pasta dish", chef_id: @chef.id)

    @ingredient_1 = Ingredient.create!(name:"Mozzarella", calories: 200)
    @ingredient_2 = Ingredient.create!(name:"Ricotta", calories: 500)
    @ingredient_3 = Ingredient.create!(name:"Beef", calories: 700)
    @ingredient_4 = Ingredient.create!(name:"Lasagna Noodles", calories: 250)

    @dish_ing_1 = DishIngredient.create!(dish: @dish_1, ingredient: @ingredient_1)
    @dish_ing_2 = DishIngredient.create!(dish: @dish_1, ingredient: @ingredient_2)
    @dish_ing_3 = DishIngredient.create!(dish: @dish_1, ingredient: @ingredient_3)
    @dish_ing_4 = DishIngredient.create!(dish: @dish_1, ingredient: @ingredient_4)

    expect(@chef.all_ingredients).to eq([@ingredient_1, @ingredient_2, @ingredient_3, @ingredient_4])
  end

  it "#most_popular_ingredients" do
    @chef = Chef.create!(name:"Gordon")
    @dish_1 = Dish.create!(name:"Lasagna", description:"layered pasta dish", chef_id: @chef.id)
    @dish_2 = Dish.create!(name:"Pizza", description:"We all know", chef_id: @chef.id)
    @dish_3 = Dish.create!(name:"Chicken Parm", description:"Melted cheese over baked chicken", chef_id: @chef.id)

    @ingredient_1 = Ingredient.create!(name:"Mozzarella", calories: 200)
    @ingredient_2 = Ingredient.create!(name:"Ricotta", calories: 500)
    @ingredient_3 = Ingredient.create!(name:"Beef", calories: 700)
    @ingredient_4 = Ingredient.create!(name:"Lasagna Noodles", calories: 250)
    @ingredient_5 = Ingredient.create!(name:"Pizza Crust", calories: 250)
    @ingredient_6 = Ingredient.create!(name:"Chicken", calories: 250)
    @ingredient_7 = Ingredient.create!(name:"Angel hair", calories: 250)
    @ingredient_8 = Ingredient.create!(name:"Basil", calories: 250)

    #lasagna ingredients
    @dish_ing_1 = DishIngredient.create!(dish: @dish_1, ingredient: @ingredient_1)
    @dish_ing_2 = DishIngredient.create!(dish: @dish_1, ingredient: @ingredient_2)
    @dish_ing_3 = DishIngredient.create!(dish: @dish_1, ingredient: @ingredient_3)
    @dish_ing_4 = DishIngredient.create!(dish: @dish_1, ingredient: @ingredient_4)

    #pizza ingredients
    @dish_ing_5 = DishIngredient.create!(dish: @dish_2, ingredient: @ingredient_1)
    @dish_ing_6 = DishIngredient.create!(dish: @dish_2, ingredient: @ingredient_5)
    @dish_ing_7 = DishIngredient.create!(dish: @dish_2, ingredient: @ingredient_6)
    @dish_ing_8 = DishIngredient.create!(dish: @dish_2, ingredient: @ingredient_8)

    #chicken parm ingredients
    @dish_ing_9 = DishIngredient.create!(dish: @dish_3, ingredient: @ingredient_1)
    @dish_ing_10 = DishIngredient.create!(dish: @dish_3, ingredient: @ingredient_6)
    @dish_ing_11 = DishIngredient.create!(dish: @dish_3, ingredient: @ingredient_7)
    @dish_ing_12 = DishIngredient.create!(dish: @dish_3, ingredient: @ingredient_8)

    expect(@chef.most_popular_ingredients).to eq([@ingredient_6, @ingredient_8, @ingredient_1])
  end
end
