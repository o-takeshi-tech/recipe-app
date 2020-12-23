class RecipesController < ApplicationController
  before_action :authenticate_user!, except:[:index]
  
  def index
    @recipes = Recipe.includes(:user)
  end

  def new
    @recipe = Recipe.new
    @recipe.recipe_ingredients.build
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to root_path
    else
      @recipe.recipe_ingredients.build
      render :new
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end
  
  private
  def recipe_params
    params.require(:recipe).permit(:name, :description, :image,
    recipe_ingredients_attributes: [:id, :recipe_id, :ingredient_id, :_destroy, 
    ingredient_attributes:[:ingredient_name]]).merge(user_id: current_user.id)
  end
end
