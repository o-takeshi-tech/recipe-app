class RecipesController < ApplicationController
  before_action :authenticate_user!, except:[:index]
  before_action :set_recipe, only:[:edit, :show, :update, :destroy]
  before_action :move_to_index, only:[:edit, :destroy, :update]

  def index
    @recipes = Recipe.includes(:user)
  end

  def new
    @recipe = Recipe.new
    @ingredients = Ingredient.all
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to root_path
    else        
      @ingredients = Ingredient.all
      render :new
    end
  end

  def show
  
  end
  
  def edit 

  end 

  def update
    if @recipe.update(recipe_params)
      redirect_to root_path
    else
      render :edit
    end
  end 

  def destroy
    if @recipe.destroy
      redirect_to root_path
    else 
      render :show
    end
  end

  def search
    @ingredients = Ingredient.search(params[:keyword])
  end

  private
  def recipe_params
    params.require(:recipe).permit(:name, :description,:image, ingredient_ids:[]).merge(user_id: current_user.id)
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def move_to_index
    unless @recipe.user.id == current_user.id
      redirect_to root_path
    end
  end
end
