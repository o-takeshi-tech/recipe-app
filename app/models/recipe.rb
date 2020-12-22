class Recipe < ApplicationRecord
  belongs_to :user
  has_many  :recipe_ingredients, dependent: :destroy
  has_many  :ingredients,  through: :recipe_ingredients
  has_one_attached :image
  accepts_nested_attributes_for :recipe_ingredients, allow_destroy: true, reject_if: :all_blank


  with_options presence: true do
    validates :name, presence: true
    validates :description, presence: true
  end
  
end
