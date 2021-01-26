class RecipeForm
  include ActiveModel::Model

  attr_accessor :name, :description, :ingredient_names, :quantities, :user_id

  with_options presence: true do
    validates :name
    validates :description
    validates :ingredient_name
    validates :quantity
  end

  def save
    recipe = Recipe.create(name: name, description: description, user_id: user_id)
    number = 0
    ingredient_names.each do |ingredient_name|
      ingredient = Ingredient.where(ingredient_name: ingredient_name, quantity: quantities[number]).first_or_initialize
      ingredient.save
      RecipeIngredient.create(recipe_id: recipe.id, ingredient_id: ingredient.id)
      number += 1
    end
  end
end