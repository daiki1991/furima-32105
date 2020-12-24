require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe '購入情報の保存' do
    before do
      @purchase_address= FactoryBot.build(:purchase_address)
    end
    
      context '保存がうまくいくとき' do

        it 'すべての値が正しく入力されていれば保存できること' do
          expect(@purchase_address).to be_valid
        end
        it '建物名は空でも保存できること' do
          @purchase_address.building = nil
          expect(@purchase_address).to be_valid
        end
      end

      context '保存がうまくいかないとき' do

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
        it "user_idが空では登録できないこと" do
          @purchase_address.user_id = nil
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("User can't be blank")
        end
        it "item_idが空では登録できないこと" do
          @purchase_address.item_id = nil
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("Item can't be blank")
        end
        it "携帯番号は12桁以上では登録できないこと" do
          @purchase_address.phone_number = '090123456789'
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("Phone number is only 11 digits number")
        end
        it "携帯番号は英数混合では登録できないこと" do
          @purchase_address.phone_number = '090abcdefgh'
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("Phone number is only 11 digits number")
        end
      end
  end
end

