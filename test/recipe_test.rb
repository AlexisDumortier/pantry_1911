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

  def test_it_can_sort_ingredient_per_calories_contributed
    ingredient1 = Ingredient.new("Cheese", "C", 100)
    ingredient2 = Ingredient.new("Macaroni", "oz", 30)
    recipe = Recipe.new("Mac and Cheese")
    recipe.add_ingredient(ingredient1, 2)
    recipe.add_ingredient(ingredient2, 8)
    assert_equal [ingredient2, ingredient1], recipe.ingredients_sorted
  end

  def test_it_can_display_ingredients
    ingredient1 = Ingredient.new("Cheese", "C", 100)
    ingredient2 = Ingredient.new("Macaroni", "oz", 30)
    recipe = Recipe.new("Mac and Cheese")
    recipe.add_ingredient(ingredient1, 2)
    recipe.add_ingredient(ingredient2, 8)
    require 'pry'; binding.pry
    recipe.display_ingredients
  end

  
  
end