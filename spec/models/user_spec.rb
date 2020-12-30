require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end
    context 'ユーザー登録ができる場合' do
      it 'username,email,passwordのすべてが正しく入力されている場合は登録できる' do
        expect(@user).to be_valid
      end
    end
    context 'ユーザー登録ができない場合' do
      it 'usernameが空だと登録できない' do
        @user.username = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Username can't be blank")
      end
      it 'emailが空だと登録できない' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailが重複している場合登録できない' do
        @user.save
        @another_user = FactoryBot.build(:user)
        @another_user.email = @user.email
        @another_user.valid?
        expect(@another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'passwordが空だと登録できない' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが全角だと登録できない' do
        @user.password = 'ＡＡＡＡＡＡＡＡ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password include both letters and numbers')
      end
      it 'passwordが半角英字だと登録できない' do
        @user.password = 'abcdefg'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password include both letters and numbers')
      end
      it 'passwordが半角数字だと登録できない' do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password include both letters and numbers')
      end
      it 'passwordが6文字以下だと登録できない' do
        @user.password = 'abc12'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'password_confirmationが一致しないと登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end
  end
end
