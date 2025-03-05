class Book < ApplicationRecord
  belongs_to :user
  has_many :book_sellers
  has_many :users, through: :book_sellers
  has_one_attached :book_image
end
