require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/recipe'
require_relative '../lib/ingredient'
require_relative '../lib/pantry'

class PantryTest < Minitest::Test 

  def test_it_exists
    pantry = Pantry.new
    assert_instance_of Pantry, pantry
  end 

  def test_it_has_attributes
    pantry = Pantry.new
    assert_equal ({}), pantry.stock
  end

  def test_it_can_return_how_much_of_an_ingredient_is_in_stock
    ingredient1 = Ingredient.new("Cheese", "C", 50)
    ingredient2 = Ingredient.new("Macaroni", "oz", 200)
    pantry = Pantry.new
    assert_equal 0, pantry.stock_check(ingredient1)
  end

  def test_it_can_restock_ingredients
    ingredient1 = Ingredient.new("Cheese", "C", 50)
    ingredient2 = Ingredient.new("Macaroni", "oz", 200)
    pantry = Pantry.new

    assert_equal 0, pantry.stock_check(ingredient1)

    pantry.restock(ingredient1, 5)
    assert_equal 5, pantry.stock_check(ingredient1)
    assert_equal 0, pantry.stock_check(ingredient2)
    
    pantry.restock(ingredient2, 7)
    assert_equal 5, pantry.stock_check(ingredient1)
    assert_equal 7, pantry.stock_check(ingredient2)

    pantry.restock(ingredient1, 10)
    assert_equal 15, pantry.stock_check(ingredient1)
  end

  def test_it_can_check_if_there_are_enough_ingredients_in_stock_for_a_recipe
    ingredient1 = Ingredient.new("Cheese", "C", 50)
    ingredient2 = Ingredient.new("Macaroni", "oz", 200)
    pantry = Pantry.new
    recipe = Recipe.new("Mac and Cheese")
    recipe.add_ingredient(ingredient1, 2)
    recipe.add_ingredient(ingredient2, 8)
    pantry.restock(ingredient1, 15)

    assert_equal false, pantry.enough_ingredients_for?(recipe)

    pantry.restock(ingredient2, 7)
    assert_equal false, pantry.enough_ingredients_for?(recipe)

    pantry.restock(ingredient2, 1)
    assert_equal true, pantry.enough_ingredients_for?(recipe)
  end
end