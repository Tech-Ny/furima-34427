require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do

    it 'nicknameが空では登録できない'do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空では登録できない'do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it '同じemailは登録できない'do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
   
    it 'passwordがなければ登録できない'do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'encrypted_passwordとpassword_confirmationが一致していないと登録できない'do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'passwordが半英数字混合でない場合は登録できない'do
      @user.password = '111111'
      @user.password_confirmation = '111111'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
    end

    it 'ユーザーの本名は名字がなければ登録できない'do
      @user.lastname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Lastname can't be blank")
    end

    it 'ユーザーの本名は名前がなければ登録できない'do
      @user.firstname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Firstname can't be blank")
    end

    it 'ユーザーの名字のフリガナは全角でなければ登録できない'do
      @user.lastnamedetail = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Lastnamedetail can't be blank")
    end

    it 'ユーザーの名前のフリガナは全角でなければ登録できない'do
      @user.firstnamedetail = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Firstnamedetail can't be blank")
    end

    it '生年月日がなければ登録できない'do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end

  end

end