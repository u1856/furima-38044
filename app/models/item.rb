class Item < ApplicationRecord

  belongs_to :user

  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :situation
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :shipping_date

  validates :name, :text, :price, presence: true

  validates :category_id, numericality: { other_than: 1 , message: "can't be blank" } 
  validates :situation_id, numericality: { other_than: 1 , message: "can't be blank" } 
  validates :delivery_charge_id, numericality: { other_than: 1 , message: "can't be blank" } 
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank" } 
  validates :shipping_date_id, numericality: { other_than: 1 , message: "can't be blank" } 

end
