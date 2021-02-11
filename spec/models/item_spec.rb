require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品新規登録' do
    it 'imageが空では登録できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it '商品名が空では登録できない' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it '金額が空では登録できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank", 'Price is out of setting range or invalid')
    end

    it '金額が300円未満では登録できない' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is out of setting range or invalid')
    end

    it '金額が9999999円以上では登録できない' do
      @item.price = 10_000_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is out of setting range or invalid')
    end

    it '金額が半角英語では登録できない' do
      @item.price = 'aaaaaaaa'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is out of setting range or invalid')
    end

    it '金額が全角文字では登録できない' do
      @item.price = '１００００'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is out of setting range or invalid')
    end

    it '金額が半英数混合では登録できない' do
      @item.price = '1111aaaa'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is out of setting range or invalid')
    end

    it 'カテゴリーのIDが1では登録できない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Category must be other than 1')
    end

    it '状態のIDが1では登録できない' do
      @item.status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Status must be other than 1')
    end

    it '送料負担者のIDが1では登録できない' do
      @item.bearer_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Bearer must be other than 1')
    end

    it '発送もとがのIDが1では登録できない' do
      @item.delivar_at_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Delivar at must be other than 1')
    end

    it 'userがいない場合は登録できない' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('User must exist')
    end
  end
end
