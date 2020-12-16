class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  has_one_attached :image


  belongs_to_active_hash :prefecture 
  belongs_to_active_hash :category
  belongs_to_active_hash :ItemCondition
  belongs_to_active_hash :ShippingFee
  belongs_to_active_hash :DaysToShip 

with_options numericality: {other_than: 1} do
  validates :item_condition_id, presence: true 
  validates :shipping_fee_id, presence: true 
  validates :prefecture_id, presence: true 
  validates :days_to_ship_id, presence: true 
  validates :category_id, presence: true
end
  
  validates :text, presence: true
  validates :item_name, presence: true 
  validates :image, presence: true

  def was_attached?
    self.image.attached?
  end

  validates :price, format: { with: /\A[0-9]+\z/, messsage: "価格は半角数字のみ入力できます"}
  validates :price, inclusion: { in: 300..9999999, message: "価格は、300円〜9,999,999円の間で入力してください"}
  validates :price, presence: true
end

