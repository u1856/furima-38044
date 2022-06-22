class DestinationPurchase
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :municipalities, :address, :building, :phone_number, :destination_id, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality:  {other_than: 0, message: "can't be blank"}
    validates :municipalities
    validates :address
    validates :phone_number, format: {with: /\A\d{10}\z|\A\d{11}\z/ , message: "is invalid"}
    validates :token
  end

  def save
    destination = Destination.create(user_id: user_id, item_id: item_id)

    Purchase.create(destination_id: destination.id, post_code: post_code, prefecture_id: prefecture_id, municipalities: municipalities, address: address, phone_number: phone_number)
  end

end