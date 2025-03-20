class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :book_seller
end
