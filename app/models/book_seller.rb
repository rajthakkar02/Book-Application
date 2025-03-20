class BookSeller < ApplicationRecord
  belongs_to :book
  belongs_to :user
  has_many :cart_items
  validates :seller_price, presence: true, numericality: { greater_than: 0 }
  validates :quantity, presence: true, numericality: { greater_than: 0 }

  def self.ransackable_associations(auth_object = nil)
    ["book", "user"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["book_id", "created_at", "id", "quantity", "seller_price", "updated_at", "user_id"]
  end
end
