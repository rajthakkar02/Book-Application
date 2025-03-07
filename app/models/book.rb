class Book < ApplicationRecord
  belongs_to :user
  has_many :book_sellers, dependent: :destroy
  has_many :users, through: :book_sellers, dependent: :destroy
  has_one_attached :book_image, dependent: :destroy
end
