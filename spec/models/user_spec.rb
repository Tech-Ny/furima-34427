require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("ニックネームを入力してください")
    end

    it 'emailに@がないとは登録できない' do
      @user.email = 'furima.com'
      @user.valid?
      expect(@user.errors.full_messages).to include('Eメールは不正な値です')
    end

    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Eメールを入力してください")
    end

    it '同じemailは登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
    end

    it 'passwordがなければ登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードを入力してください", "パスワードは英数字両方を入力してください", "パスワード（確認用）とパスワードの入力が一致しません")
    end

    it 'encrypted_passwordとpassword_confirmationが一致していないと登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
    end

    it 'passwordが半数字だけの場合は登録できない' do
      @user.password = '111111'
      @user.password_confirmation = '111111'
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは英数字両方を入力してください")
    end

    it 'passwordが5文字以下では登録できない' do
      @user.password = '111aa'
      @user.password_confirmation = '111aa'
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
    end

    it 'passwordが半英字だけの場合は登録できない' do
      @user.password = 'aaaaaa'
      @user.password_confirmation = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは英数字両方を入力してください")
    end

    it 'ユーザーの本名は名字がなければ登録できない' do
      @user.lastname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("名字(上の名前)を入力してください", "名字(上の名前)が不正です。 全角文字を入力してください")
    end

    it 'ユーザーの本名は名前がなければ登録できない' do
      @user.firstname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("名前(下の名前)を入力してください", "名前(下の名前)が不正です。 全角文字を入力してください")
    end

    it 'ユーザーの本名は名字が全角でなければ登録できない' do
      @user.lastname = 'abe'
      @user.valid?
      expect(@user.errors.full_messages).to include("名字(上の名前)が不正です。 全角文字を入力してください")
    end

    it 'ユーザーの本名は名前が全角でなければ登録できない' do
      @user.firstname = 'sadao'
      @user.valid?
      expect(@user.errors.full_messages).to include("名前(下の名前)が不正です。 全角文字を入力してください")
    end

    it 'ユーザーの名字のフリガナがなければ登録できない' do
      @user.lastnamedetail = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("名字のフリガナを入力してください", "名字のフリガナが不正です。 全角カタカナを入力してください")
    end

    it 'ユーザーの名前のフリガナがなければ登録できない' do
      @user.firstnamedetail = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("名前のフリガナを入力してください", "名前のフリガナが不正です。 全角カタカナを入力してください")
    end

    it 'ユーザーの名字のフリガナは全角でなければ登録できない' do
      @user.lastnamedetail = 'ｱﾍﾞ'
      @user.valid?
      expect(@user.errors.full_messages).to include("名字のフリガナが不正です。 全角カタカナを入力してください")
    end

    it 'ユーザーの名前のフリガナは全角でなければ登録できない' do
      @user.firstnamedetail = 'ｻﾀﾞｵ'
      @user.valid?
      expect(@user.errors.full_messages).to include("名前のフリガナが不正です。 全角カタカナを入力してください")
    end

    it '生年月日がなければ登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("誕生日を入力してください")
    end
  end
end
