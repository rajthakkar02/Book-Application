class Book < ApplicationRecord
  belongs_to :user
  has_many :book_sellers, dependent: :destroy
  has_many :users, through: :book_sellers, dependent: :destroy
  has_one_attached :book_image, dependent: :destroy
  validates :book_name, presence: true, length: { in: 1..50 }
  validates :book_image, presence: true
  validates :MRP, presence: true, numericality: { greater_than: 0 }
  validates :pages, presence: true, numericality: { greater_than: 0 }
  validates :publisher_name, presence: true, length: { in: 1..50 }
  validates :language, presence: true, length: { in: 1..50 }
end
