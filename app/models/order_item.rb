class OrderItem < ApplicationRecord
  belongs_to :book_seller
  belongs_to :order

  validates :quantity, presence: true, numericality: { greater_than: 0 }
end
