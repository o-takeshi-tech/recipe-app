class Recipe < ApplicationRecord
  belongs_to :user
  has_many  :recipe_ingredients, dependent: :destroy
  has_many  :ingredients,  through: :recipe_ingredients
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :description
    validates :recipe_ingredient_ids
  end
end
