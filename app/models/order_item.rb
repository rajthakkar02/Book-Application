class OrderItem < ApplicationRecord
  belongs_to :book_seller
  belongs_to :order
end
