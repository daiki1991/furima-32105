class Item < ApplicationRecord
  belongs_to :user
  #has_one :purchase

  validates :text, presence: true
  validates :item_name, presence: true 
  validates :price, presence: true 
  validates :item_condition_id, presence: true 
  validates :shipping_fee_id, presence: true 
  validates :prefecture_id, presence: true 
  validates :days_to_ship_id, presence: true 
  validates :category_id, presence: true
end
