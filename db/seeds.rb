# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create a chef
@gordon_ramsey = Chef.create!(name: "Gordon Ramsey")

# Create a dish
@omelette = @gordon_ramsey.dishes.create!(name: "Omelette", description: "Eggs with your choice of ingredients")

# Create an ingredient
@egg = Ingredient.create!(name: "Egg", calories: 78)

# Create IngredientDish
IngredientDish.create!(dish: @omelette, ingredient: @egg)
