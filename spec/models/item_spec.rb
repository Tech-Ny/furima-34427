require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品新規登録' do
  
  it 'imageが空では登録できない' do
    @item.image = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("image can't be blank")
  end

  it '商品名が空では登録できない' do
    @item.name = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("name can't be blank")
  end

  it 'カテゴリーのIDが1では登録できない' do
    @item.category_id = '1'
    @item.valid?
    expect(@item.errors.full_messages).to include("describe can't be blank")
  end

  it '状態のIDが1では登録できない' do
    @item.status_id = '1'
    @item.valid?
    expect(@item.errors.full_messages).to include("status_id can't be blank")
  end

  it '送料負担者のIDが1では登録できない' do
    @item. = '1'
    @item.valid?
    expect(@item.errors.full_messages).to include("Nickname can't be blank")
  end

  it '発送もとがのIDが1では登録できない' do
    @item.delivar_at_id = '1'
    @item.valid?
    expect(@item.errors.full_messages).to include("Nickname can't be blank")
  end

  it 'userがいない場合は登録できない' do
    @item.user_id = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Nickname can't be blank")
  end


end
