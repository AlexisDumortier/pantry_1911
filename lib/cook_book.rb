class CookBook

  attr_reader :recipes

  def initialize
    @recipes = []
  end 

  def add_recipe(recipe)
    @recipes << recipe
  end

  def summary
    require 'pry'; binding.pry
    @recipes.map do |recipe|
      {name: recipe.name, details: recipe.display_ingredients, total_calories: recipe.total_calories}
    end
  end 
  
end