class Address < ApplicationRecord
  has_many :orders
  belongs_to :user
  enum address_type: { Home: 0, Office: 1, Other: 2 }

  def full_address
    "#{self.address_line1.to_s}, #{self.landmark.to_s}, #{self.address_line2.to_s}, #{self.city.to_s}, #{self.state.to_s} - #{self.pincode.to_s}".squeeze(", ").strip
  end
end
