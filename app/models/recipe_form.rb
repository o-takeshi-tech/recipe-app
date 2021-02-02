class RecipeForm
  include ActiveModel::Model

  attr_accessor :name, :description, :ingredient_names, :quantities, :id, :image, :user_id

  with_options presence: true do
    validates :name
    validates :description
    validates :ingredient_name
    validates :quantity
  end

  def initialize(attribute = {})
    if !(attribute[:id] == nil)
      @recipe = Recipe.find(attribute[:id])
      @ingredients = @recipe.ingredients
      @quantity = @recipe.quantities
      @recipe_ingredients = @recipe.recipe_ingredients
      if attribute[:name] == nil
        self.id = @recipe.id
        self.name = @recipe.name
        self.description = @recipe.description
        if @recipe.image.present?
          self.image = @recipe.image
        end
        self.ingredient_names = []
        self.quantities = []
        @ingredients.each_with_index do |ingredient, i|
          self.ingredient_names << ingredient.ingredient_name
          self.quantities << @quantity[i].quantity
        end
      else
        self.id = attribute[:id]
        self.name = attribute[:name]
        self.description = attribute[:description]
        self.ingredient_names = attribute[:ingredient_names]
        self.quantities = attribute[:quantities]
        if attribute[:image].present?
          self.image = attribute[:image]
        end
      end
    else
      super(attribute)
    end
  end

  def save
    if self.image.present?
      recipe = Recipe.create(name: name, description: description, image: image ,user_id: user_id)
    else
      recipe = Recipe.create(name: name, description: description, user_id: user_id)
    end
    number = 0
    
    ingredient_names.each do |ingredient_name|
      ingredient = Ingredient.where(ingredient_name: ingredient_name).first_or_initialize
      ingredient.save
      Quantity.create(quantity: quantities[number],recipe_id: recipe.id, ingredient_id: ingredient.id)
      RecipeIngredient.create(recipe_id: recipe.id, ingredient_id: ingredient.id)
      number += 1
    end
  end

  def update
    if self.image.present?
      @recipe.update(name: name, image: image, description: description)
    else
      @recipe.update(name: name, description: description)
    end
    @ingredients.each_with_index do |ingredient, i|
      ingredient = Ingredient.where(ingredient_name: ingredient_names[i]).first_or_initialize
      ingredient.update(ingredient_name: ingredient.ingredient_name)
      @quantity[i].update(quantity: quantities[i], recipe_id: @recipe.id, ingredient_id: ingredient.id)
      @recipe_ingredients[i].update(recipe_id: @recipe.id, ingredient_id: ingredient.id)
    end
  end
end