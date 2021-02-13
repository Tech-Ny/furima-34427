require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @order_address = FactoryBot.build(:order_address)
  end

  describe '購入情報入力' do
    
    it "tokenが空だと登録できない" do
      @order_address.token = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Token can't be blank")
    end
    
    it 'post_numが空だと保存できない' do
      @order_address.post_num = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Post num can't be blank", "Post num is invalid. Include hyphen(-)")
    end
    it 'post_numが半角のハイフンを含んだ正しい形式でないと保存できない' do
      @order_address.post_num = '1234567'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Post num is invalid. Include hyphen(-)")
    end

    it '発送元のidが1の場合保存できない' do
      @order_address.region_id = 1
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Region must be other than 1')
    end

    it 'cwtvが空だと保存できない' do
      @order_address.cwtv = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Cwtv can't be blank")
    end

    it 'addressesが空だと保存できない' do
      @order_address.addresses = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Addresses can't be blank")
    end
    it 'buildingは空でも保存できる' do
      @order_address.building = ''
      @order_address.valid?
      #expect(@order_address.errors.full_messages).to include("addresses can't be blank")
    end

    it 'phone_numが空だと保存できない' do
      @order_address.phone_num = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone num can't be blank", "Phone num is invalid")

    end

    #it 'userがいない場合は保存できない' do
    #  @order_address.user_id = nil
    #  @order_address.valid?
    #  expect(@order_addresses.errors.full_messages).to include('User must exist')
    #end

    #it 'itemがない場合は保存できない' do
    #  @order_address.item_id = nil
    #  @order_address.valid?
    #  expect(@order_addresses.errors.full_messages).to include('User must exist')
    #end


  
  end


end
