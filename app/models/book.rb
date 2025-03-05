class Book < ApplicationRecord
  belongs_to :user
  has_many :book_sellers
  has_many :users, through: :book_sellers
end
