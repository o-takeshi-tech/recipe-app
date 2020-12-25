require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe "レシピ登録" do
    before do 
      @ingredient = FactoryBot.create(:ingredient)
      @recipe = FactoryBot.build(:recipe)
      @recipe.ingredient_ids = @ingredient.id     
    end 
    context 'レシピ登録ができる時' do
      it 'name,description,image,user,ingredient_idsが揃えば保存できる' do
        expect(@recipe).to be_valid
      end
    end
    context 'レシピ登録ができない時' do
      it 'nameが空だと保存できない' do
        @recipe.name = nil
        @recipe.valid?
        expect(@recipe.errors.full_messages).to include("Name can't be blank")
      end
      it 'descriptionが空だと保存できない' do
        @recipe.description = nil
        @recipe.valid?
        expect(@recipe.errors.full_messages).to include("Description can't be blank")
      end
      it 'ingredient_idsが空だと保存できない' do
        @recipe.ingredient_ids = nil
        @recipe.valid?
        expect(@recipe.errors.full_messages).to include("Recipe ingredient ids can't be blank")
      end
      it 'imageが空だと保存できない' do
        @recipe.image = nil
        @recipe.valid?
        expect(@recipe.errors.full_messages).to include("Image can't be blank")
      end
      it 'userが紐付いていないと保存できない' do
        @recipe.user = nil
        @recipe.valid?
        expect(@recipe.errors.full_messages).to include("User must exist")
      end
    end

  end
end
