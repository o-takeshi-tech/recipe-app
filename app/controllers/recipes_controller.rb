class RecipesController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_recipe, only: %i[edit show update destroy]
  before_action :set_ingredients, only: %i[edit new content]
  before_action :move_to_index, only: %i[edit destroy update]

  def index
    @recipes = Recipe.includes(:user).order("created_at DESC")
  end

  def new
    @recipe = RecipeForm.new
  end

  def create
    @recipe = RecipeForm.new(recipe_params)
    if @recipe.save
      redirect_to root_path
    else
      render :content
    end
  end

  def content
    @recipe = RecipeForm.new(recipe_params)
  end

  def show; end

  def edit
    @recipe = RecipeForm.new(id: params[:id])
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

  def match
    return nil if params[:keyword] == ''

    ingredient = Ingredient.where(['ingredient_name LIKE ?', "%#{params[:keyword]}%"]) 
    
    render json: { keyword: ingredient }
  end

  def search
    @ingredients = Ingredient.search(params[:keyword])
    @recipes = Recipe.search(params[:keyword])
    @results = []
    
    @ingredients.each do |ingredient|
      ingredient.recipes.each do |recipe|
        @results << recipe
      end
    end

    @recipes.each do |recipe|
      @results << recipe
    end
    
    @results = @results.uniq
  end

  private

  def recipe_params
    params.require(:recipe_form).permit(:name, :description, :image, ingredient_names:[], quantities: []).merge(user_id: current_user.id)
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
