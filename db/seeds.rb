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

@chef_1 = Chef.create!(name: "Murph")

@dish_1 = Dish.create!(name: "Spaghetti", description: "noodles and sauce")
@dish_2 = Dish.create!(name: "Smoothie", description: "fruits blended together")

@ingredient_1 = @dish_1.ingredients.create!(name: "noodles", calories: 200)
@ingredient_2 = @dish_1.ingredients.create!(name: "sauce", calories: 80)
@ingredient_3 = @dish_2.ingredients.create!(name: "strawberries", calories: 30)
@ingredient_4 = @dish_2.ingredients.create!(name: "blueberries", calories: 40)