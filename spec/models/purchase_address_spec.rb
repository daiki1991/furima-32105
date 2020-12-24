require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe '購入情報の保存' do
    before do
      @purchase_address= FactoryBot.build(:purchase_address)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@purchase_address).to be_valid
    end
    it 'postcodeが空だと保存できないこと' do
      @purchase_address.postcode = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Postcode can't be blank")
    end
    it 'postcodeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @purchase_address.postcode = '1234567'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postcode is invalid. Include hyphen(-)")
    end
    it 'prefectureを選択していないと保存できないこと' do
      @purchase_address.prefecture_id = 0
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Prefecture can't be blank")
    end
    it 'cityが空だと保存できない' do
      @purchase_address.city = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("City can't be blank")
    end
    it 'blockが空だと保存できない' do
      @purchase_address.block = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Block can't be blank")
    end
    it 'buildingは空でも保存できること' do
      @purchase_address.building = nil
      expect(@purchase_address).to be_valid
    end
    it 'phone_numberが空だと保存できない' do
      @purchase_address.phone_number = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank")
    end

    it "tokenが空では登録できないこと" do
      @purchase_address.token = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
    end

  end
end

