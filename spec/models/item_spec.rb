require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品新規登録' do
    it 'imageが空では登録できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("商品の画像を入力してください")
    end

    it '商品名が空では登録できない' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("商品名を入力してください")
    end

    it '金額が空では登録できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("商品の値段を入力してください", "商品の値段が不正です 半角数字かつ¥300~¥9,999,999の間で設定してください。")
    end

    it '金額が300円未満では登録できない' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("商品の値段が不正です 半角数字かつ¥300~¥9,999,999の間で設定してください。")
    end

    it '金額が9999999円以上では登録できない' do
      @item.price = 10000000000
      @item.valid?
      expect(@item.errors.full_messages).to include("商品の値段が不正です 半角数字かつ¥300~¥9,999,999の間で設定してください。")
    end

    it '金額が半角英語では登録できない' do
      @item.price = 'aaaaaaaa'
      @item.valid?
      expect(@item.errors.full_messages).to include("商品の値段が不正です 半角数字かつ¥300~¥9,999,999の間で設定してください。")
    end

    it '金額が全角文字では登録できない' do
      @item.price = '１００００'
      @item.valid?
      expect(@item.errors.full_messages).to include("商品の値段が不正です 半角数字かつ¥300~¥9,999,999の間で設定してください。")
    end

    it '金額が半英数混合では登録できない' do
      @item.price = '1111aaaa'
      @item.valid?
      expect(@item.errors.full_messages).to include("商品の値段が不正です 半角数字かつ¥300~¥9,999,999の間で設定してください。")
    end

    it 'カテゴリーのIDが1では登録できない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("商品カテゴリーは「---」以外を設定してください")
    end

    it '状態のIDが1では登録できない' do
      @item.status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("商品の状態は「---」以外を設定してください")
    end

    it '送料負担者のIDが1では登録できない' do
      @item.bearer_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("配送料の負担は「---」以外を設定してください")
    end

    it '発送もとがのIDが1では登録できない' do
      @item.delivar_at_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("発送予定日は「---」以外を設定してください")
    end

    it 'userがいない場合は登録できない' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Userを入力してください")
    end
  end
end
