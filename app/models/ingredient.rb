class Ingredient < ApplicationRecord
  has_many :recipe_ingredients, dependent: :destroy
  has_many :recipes, through: :recipe_ingredients

  validates :ingredient_name, presence: true

  def self.search(search)
    Ingredient.where('ingredient_name LIKE(?)', "%#{search}%") if search != ''
  end
end
