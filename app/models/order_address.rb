class OrderAddress

  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_num, :cwtv, :address, :building, :region_id, :phone_num

  with_options presence: true do
    validates :post_num,  format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :cwtv
    validates :address
    validates :region_id, numericality: { other_than: 1 }
    validates :phone_num, format: {with: /\A\d{11}\z/}
  end
  
  def save
    order = Order.create(user_id: current_user.id,item_id: item.id)
    Address.create(post_num: post_num, cwtv: cwtv, city: city, address: address, building: building, region_id: region_id, phone_num: phone_num,order_id: order.id)
  end

end