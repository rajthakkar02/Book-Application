class Address < ApplicationRecord
  belongs_to :user
  enum address_type: { Home: 0, Office: 1, Other: 2 }
end
