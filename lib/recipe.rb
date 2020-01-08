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

  def total_calories
    ingredients_required.sum { |ingredient| ingredient[0].calories * ingredient[1] }
  end

end