class Recipe < ApplicationRecord
  belongs_to :user
  has_many  :recipe_ingredients, dependent: :destroy
  has_many  :ingredients, through: :recipe_ingredients
  has_one_attached :image


  def self.search(search)
    Recipe.where('name LIKE(?)', "%#{search}%") if search != ''
  end
end
