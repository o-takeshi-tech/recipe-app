class RecipeForm
  include ActiveModel::Model

  attr_accessor :name, :description, :ingredient_name, :user_id

  with_options presence: true do
    validates :name
    validates :description
    validates :ingredient_name
  end

  def save
    binding.pry
    ingredient = Ingredient.create(ingredient_name: ingredient_name)
    recipe = Recipe.create(name: name, description: description, user_id: user_id)
    RecipeIngredient.create(recipe_id: recipe.id, ingredient_id: ingredient.id)
  end
end