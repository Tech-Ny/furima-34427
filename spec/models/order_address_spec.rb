require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.build(:item)
    @order_address = FactoryBot.build(:order_address, user_id:user.id, item_id:item.id)
  end

  describe '購入情報入力' do
    
    it "tokenが空だと登録できない" do
      @order_address.token = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("トークンを入力してください")
    end
    
    it 'post_numが空だと保存できない' do
      @order_address.post_num = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("郵便番号を入力してください")
    end
    it 'post_numが半角のハイフンを含んだ正しい形式でないと保存できない' do
      @order_address.post_num = '1234567'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("郵便番号が不正です ハイフン(-)を入れてください")
    end

    it '発送元のidが1の場合保存できない' do
      @order_address.region_id = 1
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("都道府県は1以外の値にしてください")
    end

    it 'cwtvが空だと保存できない' do
      @order_address.cwtv = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("市区町村を入力してください")
    end

    it 'addressesが空だと保存できない' do
      @order_address.addresses = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("番地を入力してください")
    end
    it 'buildingは空でも保存できる' do
      @order_address.building = ''
      @order_address.valid?
      #expect(@order_address.errors.full_messages).to include("addresses can't be blank")
    end

    it 'phone_numが空だと保存できない' do
      @order_address.phone_num = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("電話番号を入力してください", "電話番号は不正な値です")

    end
  
  end


end
