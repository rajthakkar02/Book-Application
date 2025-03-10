class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :books, dependent: :destroy
  has_many :book_sellers, dependent: :destroy
  has_many :books, through: :book_sellers, dependent: :destroy
  has_many :addresses, dependent: :destroy
  enum role: { customer: 0, seller: 1, author: 2 }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  validates :phone_number, presence: true, numericality: { only_integer: true }, length: { is: 10 }
end
