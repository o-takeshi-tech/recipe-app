class IngredientsController < ApplicationController
  before_action :authenticate_user!

  def new
    @ingredient = Ingredient.new
  end

  def create
    @recipe = Recipe.new
    @ingredient = Ingredient.new(ingredient_params)
    @ingredient = Ingredient.where(ingredient_name: @ingredient.ingredient_name).first_or_initialize
    if @ingredient.valid?
      @ingredient.save
      redirect_to new_recipe_path
    else
      render :new
    end
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:ingredient_name)
  end
end
