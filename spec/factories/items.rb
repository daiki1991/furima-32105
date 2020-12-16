FactoryBot.define do
  factory :item do
    item_name             {"商品名"}
    price                 {300}
    item_condition_id     {2}
    shipping_fee_id       {2}          
    prefecture_id         {2}
    days_to_ship_id       {2}
    category_id           {2}         
    text                  {"商品です"}   
    user
    
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/image.png'), filename: 'image.png')
    end
  end
end
