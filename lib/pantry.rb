class Pantry

  attr_reader :stock

  def initialize
   @stock = {}
  end

  def stock_check(ingredient)
    @stock[ingredient].nil? ? 0 : @stock[ingredient]
  end

  def restock(ingredient, quantity)
    @stock[ingredient].nil? ? @stock[ingredient] = quantity : @stock[ingredient] += quantity
  end
  
  def enough_ingredients_for?(recipe)
    enough_ingredients = recipe.ingredients_required.reduce({}) do |result, ingredient| 
      if @stock[ingredient[0]].nil? 
        result[ingredient[0]] = false 
      else
        result[ingredient[0]] = (ingredient[1] <= @stock[ingredient[0]])
      end
      result
    end
    !(enough_ingredients.values.include? false)
  end

end