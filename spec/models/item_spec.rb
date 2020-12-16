require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
   @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    it "商品名が空では登録できない" do
      @item.item_name = ""
      @item.valid?
      expect(@item.errors.full_messages).to include "Item name can't be blank"
    end

   it "商品の説明が空では登録できない" do
    @item.text = ""
    @item.valid?
    expect(@item.errors.full_messages).to include "Text can't be blank"
    end

    it "カテゴリーが空では登録できない" do
      @item.category_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include "Category can't be blank"
    end

    it "商品の状態が空では登録できない" do
      @item.item_condition_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include "Item condition can't be blank"
    end
 
    it "配送料の負担が空では登録できない" do
      @item.shipping_fee_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include "Shipping fee can't be blank"
    end

    it "発送元地域が空では登録できない" do
      @item.prefecture_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include "Prefecture can't be blank"
    end

    it "発送までの日数が空では登録できない" do
      @item.days_to_ship_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include "Days to ship can't be blank"
    end

    it "画像が空では登録できない" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include "Image can't be blank"
    end

    it "価格は設定した金額の範囲内でしか登録できない" do
      @item.price = "abc"
      @item.valid?
      expect(@item.errors.full_messages).to include "Price 価格は、300円〜9,999,999円の間で入力してください"
    end

    it "価格は299円以下は登録できない" do
      @item.price = "299"
      @item.valid?
      expect(@item.errors.full_messages).to include "Price 価格は、300円〜9,999,999円の間で入力してください"
    end

    it "価格は10000000円以上は登録できない" do
      @item.price = "10000000"
      @item.valid?
      expect(@item.errors.full_messages).to include "Price 価格は、300円〜9,999,999円の間で入力してください"

    end

    it "価格が空では登録できない" do
      @item.price = ""
      @item.valid?
      expect(@item.errors.full_messages).to include "Price can't be blank"
    end

    it "カテゴリーは値が1の時は、登録できない" do
      @item.category_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include "Category 値が1の時は、登録できない"
    end

    it "商品の状態は値が1の時は、登録できない" do
      @item.item_condition_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include "Item condition 値が1の時は、登録できない"
    end

    it "配送料の負担は値が1の時は、登録できない" do
      @item.shipping_fee_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include "Shipping fee 値が1の時は、登録できない"
    end

    it "発送元地域は値が1の時は、登録できない" do
      @item.prefecture_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include "Prefecture 値が1の時は、登録できない"
    end

    it "発送までの日数は値が1の時は、登録できない" do
      @item.days_to_ship_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include "Days to ship 値が1の時は、登録できない"
    end



  end
end
