class RecipesController < ApplicationController
  before_action :authenticate_user!, except:[:index]
  
  def index
  end
  def new
    @recipe = Recipe.new
  end

  def create
    binding.pry
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def recipe_params
    params.require(:recipe).permit(:name, :description, ingredient_ids:[]).merge(user_id: current_user.id)
  end
end
