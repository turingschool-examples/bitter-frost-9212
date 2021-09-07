# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Chef.destroy_all
Dish.destroy_all
Ingredient.destroy_all

@chef_1 = Chef.create!(name: "Ryan Gatorman")
@chef_2 = Chef.create!(name: "Risky Riskin")
@dish_1 = Dish.create!(name: "Chilli of Forgiveness", description: "White bean turkey chilli with fall vegetables", chef: @chef_1)
@dish_2 = Dish.create!(name: "Breakfast Bowl", description: "Easy breakfast bowl to start any day.", chef: @chef_1)
@dish_3 = Dish.create!(name: "Egg Roll in a Bowl", description: "Tasty Asian inspired lunch bowl", chef: @chef_1)
@ingredient_1 = Ingredient.create!(name: "Ground Turkey", calories: 90)
@ingredient_2 = Ingredient.create!(name: "Butternut Squash", calories: 75)
@ingredient_3 = Ingredient.create!(name: "Kale", calories: 50)
@ingredient_4 = Ingredient.create!(name: "Egg", calories: 50)
@ingredient_5 = Ingredient.create!(name: "Chorizo", calories: 120)
@ingredient_6 = Ingredient.create!(name: "Rice", calories: 90)
@dish_1.ingredients << @ingredient_1
@dish_1.ingredients << @ingredient_2
@dish_1.ingredients << @ingredient_3
@dish_2.ingredients << @ingredient_3
@dish_2.ingredients << @ingredient_4
@dish_2.ingredients << @ingredient_5
@dish_3.ingredients << @ingredient_1
@dish_3.ingredients << @ingredient_3
@dish_3.ingredients << @ingredient_4
@dish_3.ingredients << @ingredient_6
