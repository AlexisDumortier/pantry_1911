# require './lib/cook_book'
# => true

# require './lib/ingredient'
# => true

# require './lib/recipe'
# => true

# cookbook = CookBook.new
# => #<CookBook:0x00007faae6a42228 @recipes=[]>

# ingredient1 = Ingredient.new("Cheese", "C", 100)
# => #<Ingredient:0x00007faae6a207e0...>

# ingredient2 = Ingredient.new("Macaroni", "oz", 30)
# => #<Ingredient:0x00007faae69e3cf0...>

# recipe1 = Recipe.new("Mac and Cheese")
# => #<Recipe:0x00007faae69c9698...>

# recipe1.add_ingredient(ingredient1, 2)

# recipe1.add_ingredient(ingredient2, 8)

# ingredient3 = Ingredient.new("Ground Beef", "oz", 100)
# => #<Ingredient:0x00007faae6950860...>

# ingredient4 = Ingredient.new("Bun", "g", 1)
# => #<Ingredient:0x00007faae694bb80...>

# recipe2 = Recipe.new("Burger")
# => #<Recipe:0x00007faae692a110...>

# recipe2.add_ingredient(ingredient3, 4)

# recipe2.add_ingredient(ingredient4, 100)

# cookbook.add_recipe(recipe1)

# cookbook.add_recipe(recipe2)

# cookbook.summary
# => [{:name=>"Mac and Cheese", :details=>{:

require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/recipe'
require_relative '../lib/ingredient'
require_relative '../lib/pantry'
require_relative '../lib/cook_book'

class CookBookTest < Minitest::Test

  def test_it_exists
    cookbook = CookBook.new
    assert_instance_of CookBook, cookbook
  end 

  def test_it_has_attributes
    cookbook = CookBook.new
    assert_equal [], cookbook.recipes
  end 
  

  def test_it_can_add_recipe
    cookbook = CookBook.new
    ingredient1 = Ingredient.new("Cheese", "C", 100)
    ingredient2 = Ingredient.new("Macaroni", "oz", 30)
    recipe1 = Recipe.new("Mac and Cheese")
    recipe1.add_ingredient(ingredient1, 2)
    recipe1.add_ingredient(ingredient2, 8)

    cookbook.add_recipe(recipe1)
    assert_equal [recipe1], cookbook.recipes

    ingredient3 = Ingredient.new("Ground Beef", "oz", 100)
    ingredient4 = Ingredient.new("Bun", "g", 1)
    recipe2 = Recipe.new("Burger")
    recipe2.add_ingredient(ingredient3, 4)
    recipe2.add_ingredient(ingredient4, 100)
    cookbook.add_recipe(recipe2)
    assert_equal [recipe1, recipe2], cookbook.recipes
  end

  def test_it_can_return_the_summary
    cookbook = CookBook.new
    ingredient1 = Ingredient.new("Cheese", "C", 100)
    ingredient2 = Ingredient.new("Macaroni", "oz", 30)
    recipe1 = Recipe.new("Mac and Cheese")
    recipe1.add_ingredient(ingredient1, 2)
    recipe1.add_ingredient(ingredient2, 8)
    cookbook.add_recipe(recipe1)
    ingredient3 = Ingredient.new("Ground Beef", "oz", 100)
    ingredient4 = Ingredient.new("Bun", "g", 1)
    recipe2 = Recipe.new("Burger")
    recipe2.add_ingredient(ingredient3, 4)
    recipe2.add_ingredient(ingredient4, 100)
    cookbook.add_recipe(recipe2)
    expected = [
      {:name=>"Mac and Cheese", :details=>{:ingredients=>[{:ingredient=>"Macaroni", :amount=>"8 oz"}, {:ingredient=>"Cheese", :amount=>"2 C"}], :total_calories=>440}}, 
      {:name=>"Burger", :details=>{:ingredients=>[{:ingredient=>"Ground Beef", :amount=>"4 oz"}, {:ingredient=>"Bun", :amount=>"100 g"}], :total_calories=>500}}
    ]
    assert_equal true, expected == cookbook.summary
  end

end
  