class BookSeller < ApplicationRecord
  belongs_to :book
  belongs_to :user
  validates :seller_price, presence: true, numericality: { greater_than: 0 }
  validates :quantity, presence: true, numericality: { greater_than: 0 }
end
