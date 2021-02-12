require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @addresses = FactoryBot.build(:item)
  end

  describe '購入情報入力' do
    
    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@addresses).to be_valid
    end

    it 'post_numが空だと保存できないこと' do

    end
    it 'post_numが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      
    end
    it 'prefectureを選択していないと保存できないこと' do
    end
    it 'cityは空でも保存できること' do
    end
    it 'house_numberは空でも保存できること' do
    end
    it 'building_nameは空でも保存できること' do
    end
    it 'priceが空だと保存できないこと' do
    end
    it 'priceが全角数字だと保存できないこと' do
    end
    it 'priceが1円未満では保存できないこと' do
    end
    it 'priceが1,000,000円を超過すると保存できないこと' do
    end
  
  end


end
