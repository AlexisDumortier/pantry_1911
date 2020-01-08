class Recipe

  attr_reader :name, :ingredients_required

  def initialize(name)
    @name = name
    @ingredients_required = {}
  end

  def add_ingredient(ingredient, quantity)
    @ingredients_required[ingredient] = quantity
  end

  def amount_required(ingredient)
    @ingredients_required[ingredient].nil? ? 0 : @ingredients_required[ingredient]
  end

  def ingredients
    ingredients_required.map {|ingredient| ingredient[0]}
  end 

  def ingredients_sorted
    @ingredients_required.sort_by do |ingredient|
      ingredient[0].calories * ingredient[1]
    end.map do |ingredient|
      ingredient[0]
    end.reverse
  end

  def display_ingredients
    temp = ingredients_sorted.map do |ingredient|
      require 'pry'; binding.pry
      {ingredient: ingredient.name, amount: @ingredients_required[ingredient].to_s + " " + ingredient.unit}
    end
  end

  def total_calories
    ingredients_required.sum { |ingredient| ingredient[0].calories * ingredient[1] }
  end

end