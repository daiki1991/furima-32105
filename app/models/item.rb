class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

    belongs_to :user
    has_one_attached :image


    belongs_to :prefecture 
    belongs_to :category
    belongs_to :item_condition
    belongs_to :shipping_fee
    belongs_to :days_to_ship

  with_options numericality: {other_than: 1, message: "値が1の時は、登録できない"} do
    validates :item_condition_id, presence: true 
    validates :shipping_fee_id, presence: true 
    validates :prefecture_id, presence: true 
    validates :days_to_ship_id, presence: true 
    validates :category_id, presence: true
  end
  with_options presence: true do
    validates :price, inclusion: { in: 300..9999999, message: "価格は、300円〜9,999,999円の間で入力してください"}
    validates :price, format: { with: /\A[0-9]+\z/, message: '価格は、半角数字で入力してください'}
    validates :text
    validates :item_name 
    validates :image
  end

    def was_attached?
      self.image.attached?
    end

  
    
end

