# pry(main)> require './lib/ingredient'
# # => true

# pry(main)> require './lib/recipe'
# # => true

# pry(main)> ingredient1 = Ingredient.new("Cheese", "C", 100)
# # => #<Ingredient:0x007fe8438c7a70...>

# pry(main)> ingredient2 = Ingredient.new("Macaroni", "oz", 30)
# # => #<Ingredient:0x007fe843857f40...>

# pry(main)> recipe = Recipe.new("Mac and Cheese")
# # => #<Recipe:0x007fe84383d000...>

# pry(main)> recipe.name
# # => "Mac and Cheese"

# pry(main)> recipe.ingredients_required
# # => {}

# pry(main)> recipe.add_ingredient(ingredient1, 2)

# pry(main)> recipe.add_ingredient(ingredient2, 8)

# pry(main)> recipe.ingredients_required
# # => {#<Ingredient:0x00007fd7811553c8...> => 2, #<Ingredient:0x00007fd78110b0e8...> => 8}

# pry(main)> recipe.amount_required(ingredient1)
# # => 2

# pry(main)> recipe.amount_required(ingredient2)       
# # => 8

# pry(main)> recipe.ingredients
# # => [#<Ingredient:0x007fe8438c7a70...>, #<Ingredient:0x007fe843857f40...>]

# pry(main)> recipe.total_calories
# => 440

require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/recipe'
require_relative '../lib/ingredient'


class RecipeTest < Minitest::Test 

  def test_it_exists
    recipe = Recipe.new("Mac and Cheese")
    assert_instance_of Recipe, recipe
  end 

  def test_it_has_attributes
    recipe = Recipe.new("Mac and Cheese")
    assert_equal "Mac and Cheese", recipe.name
    assert_equal ({}), recipe.ingredients_required
  end 

  def test_it_can_add_ingredients_required
    ingredient1 = Ingredient.new("Cheese", "C", 100)
    ingredient2 = Ingredient.new("Macaroni", "oz", 30)
    recipe = Recipe.new("Mac and Cheese")
    assert_equal ({}), recipe.ingredients_required
    recipe.add_ingredient(ingredient1, 2)
    assert_equal ( { ingredient1 => 2 } ), recipe.ingredients_required
    recipe.add_ingredient(ingredient2, 8)
    assert_equal ( { ingredient1 => 2, ingredient2 => 8 } ), recipe.ingredients_required
  end

  def test_it_can_determine_required_amount_for_each_ingredient
    ingredient1 = Ingredient.new("Cheese", "C", 100)
    ingredient2 = Ingredient.new("Macaroni", "oz", 30)
    recipe = Recipe.new("Mac and Cheese")
    recipe.add_ingredient(ingredient1, 2)
    recipe.add_ingredient(ingredient2, 8)
    assert_equal 2, recipe.amount_required(ingredient1)
    assert_equal 8, recipe.amount_required(ingredient2)
  end

  def test_it_can_return_the_array_of_ingredients_required
    ingredient1 = Ingredient.new("Cheese", "C", 100)
    ingredient2 = Ingredient.new("Macaroni", "oz", 30)
    recipe = Recipe.new("Mac and Cheese")
    recipe.add_ingredient(ingredient1, 2)
    recipe.add_ingredient(ingredient2, 8)
    assert_equal [ingredient1, ingredient2], recipe.ingredients
  end

  def test_it_can_return_the_total_number_of_calories_for_the_recipe
    ingredient1 = Ingredient.new("Cheese", "C", 100)
    ingredient2 = Ingredient.new("Macaroni", "oz", 30)
    recipe = Recipe.new("Mac and Cheese")
    recipe.add_ingredient(ingredient1, 2)
    recipe.add_ingredient(ingredient2, 8)
    assert_equal 440, recipe.total_calories
  end 
  

end