class OrderAddress

  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal, :area_id, :city, :block, :building, :phonenumber, :token
 
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal, format: {with: /\A\d{3}[-]\d{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :area_id, numericality: { other_than: 0 }
    validates :city
    validates :block
    validates :phonenumber, format: {with: /\A\d{10,11}\z/}
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal: postal, area_id: area_id, city: city, block: block, building: building, phonenumber: phonenumber, order_id: order.id)
  end


end

