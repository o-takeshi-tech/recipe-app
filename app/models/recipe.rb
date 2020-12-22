class Recipe < ApplicationRecord
  belongs_to :user
  has_many  :recipe_ingredients, dependent: :destroy
  has_many  :ingredients,  through: :recipe_ingredients
end
