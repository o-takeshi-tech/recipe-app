class RecipeForm
  include ActiveModel::Model

  attr_accessor :name, :description, :ingredient_names, :quantities, :user_id

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
      @quantities = @recipe.quantities
      if attribute[:name] == nil
        self.name = @recipe.name
        self.description = @recipe.description
        self.ingredient_names = @ingredients
        self.quantities = @quantities
        if @recipe.image.present?
          self.image = @recipe.image
        end
      else
        self.name = attribute[:name]
        self.image = attribute[:image]
        self.description = attribute[:description]
        self.ingredients = attribute[:ingredients]
      end
    else
      super(attribute)
    end
  end

  def save
    recipe = Recipe.create(name: name, description: description, user_id: user_id)
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
    @recipe.update(name: name, image: image, description: description)
    
  end
end