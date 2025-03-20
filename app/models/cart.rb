class Cart < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :book_sellers, through: :cart_items
  before_create :set_secret_id

  def total_price
    cart_items.includes(:book_seller).sum { |item| item&.book_seller.seller_price * item.quantity }
  end

  private

  def set_secret_id
    self.secret_id = SecureRandom.uuid + Date.current.to_s
  end
end
