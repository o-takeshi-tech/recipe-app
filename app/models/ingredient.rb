class Ingredient < ApplicationRecord
  has_many :recipe_ingredients, dependent: :destroy
  has_many :recipes, through: :recipe_ingredients 

  validates :ingredient_name, presence: true


  def self.search(search)
    if search != ""
      Ingredient.where('ingredient_name LIKE(?)', "%#{search}%")
    else 
      return nil      
    end
  end
end
