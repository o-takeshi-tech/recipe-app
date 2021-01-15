class RecipesController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_recipe, only: %i[edit show update destroy]
  before_action :set_ingredients, only: %i[edit new]
  before_action :move_to_index, only: %i[edit destroy update]

  def index
    @recipes = Recipe.includes(:user).order("created_at DESC")
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to root_path
    else
      @ingredients = Ingredient.includes(:user).order("created_at DESC")
      render :new
    end
  end

  def show; end

  def edit; end

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
    return nil if params[:keyword] == ''

    ingredient = Ingredient.where(['ingredient_name LIKE ?', "%#{params[:keyword]}%"])
    render json: { keyword: ingredient }
  end

  def submit
    @ingredients = Ingredient.search(params[:keyword])
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :description, :image, ingredient_ids: []).merge(user_id: current_user.id)
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def move_to_index
    redirect_to root_path unless @recipe.user.id == current_user.id
  end

  def set_ingredients
    @ingredients = Ingredient.all
  end
end
