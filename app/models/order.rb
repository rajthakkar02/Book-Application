class Order < ApplicationRecord
  has_many :order_items, dependent: :destroy
  has_many :book_sellers, through: :order_items
  belongs_to :address
  enum order_status: { Order_Placed: 0, Shipped: 1, Delivered: 3 }
  validates :total_price, presence: true, numericality: { greater_than: 0 }
  validates :order_status, presence: true
end
