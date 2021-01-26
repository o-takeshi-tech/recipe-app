class RecipeForm
  include ActiveModel::Model

  attr_accessor :name, :description, :ingredient_names, :user_id

  with_options presence: true do
    validates :name
    validates :description
    validates :ingredient_name
  end

  def save
    recipe = Recipe.create(name: name, description: description, user_id: user_id)

    ingredient_names.each do |ingredient_name|
      ingredient = Ingredient.where(ingredient_name: ingredient_name).first_or_initialize
      ingredient.save
      RecipeIngredient.create(recipe_id: recipe.id, ingredient_id: ingredient.id)
    end
  end
end