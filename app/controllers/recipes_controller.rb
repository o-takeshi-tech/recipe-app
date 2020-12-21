class RecipesController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def recipe_params
    params.require(:recipe).permit(:name, :description, :ingredient).merge(user_id: current_user.id)
  end
end
