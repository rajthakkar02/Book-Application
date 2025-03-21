class Address < ApplicationRecord
  has_many :orders
  belongs_to :user
  enum address_type: { Home: 0, Office: 1, Other: 2 }
  validates :address_line1, presence: true, length: { in: 5..50 }
  validates :address_line2, presence: true, length: { in: 2..50 }
  validates :landmark, presence: true, length: { in: 2...50 }
  validates :city, presence: true, length: { maximum: 100 }
  validates :state, presence: true, length: { maximum: 100 }
  validates :pincode, presence: true, numericality: { greater_than: 0 }

  def full_address
    "#{self.address_line1}, #{self.landmark}, #{self.address_line2}, #{self.city}, #{self.state} - #{self.pincode}".squeeze(", ").strip
  end
end
