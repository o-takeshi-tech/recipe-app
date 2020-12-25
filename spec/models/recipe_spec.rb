require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe "レシピ登録" do
    before do 
      @ingredient = FactoryBot.create(:ingredient)
      @recipe = FactoryBot.build(:recipe)
      @recipe.recipe_ingredients.build
    end 
    context 'レシピ登録ができる時' do
      it 'name,description,image,userが揃えば保存できる' do
        binding.pry
        expect(@recipe).to be_valid
      end
    end
    context 'レシピ登録ができない時' do
      it 'nameが空だと保存できない' do
      end
      it 'descriptionが空だと保存できない' do
      end
      it 'recipe_ingredientsが空だと保存できない' do
      end
      it 'imageが空だと保存できない' do
      end
      it 'userが紐付いていないと保存できない' do
      end
    end

  end
end
