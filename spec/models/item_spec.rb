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

    it "価格は半角数字での入力でないと登録できない" do
      @item.price = ""
      @item.valid?
      expect(@item.errors.full_messages).to include "Price 価格は半角数字のみ入力できます"
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



  end
end
