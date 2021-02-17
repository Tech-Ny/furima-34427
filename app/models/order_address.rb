class OrderAddress

  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_num, :cwtv, :addresses, :building, :region_id, :phone_num,:token

  with_options presence: true do
    #validates :post_num,  format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :post_num,  format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "が不正です ハイフン(-)を入れてください"}
    validates :cwtv
    validates :addresses
    validates :region_id, numericality: { other_than: 1 }
    validates :phone_num, format: {with: /\A\d{11}\z/}
    validates :token
    validates :user_id
    validates :item_id
  end
  
  def save
   order = Order.create(user_id: user_id,item_id: item_id)
   Address.create(post_num: post_num, cwtv: cwtv, addresses: addresses, building: building, region_id: region_id, phone_num: phone_num,order_id: order.id)
  end

end