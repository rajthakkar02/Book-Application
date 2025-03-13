class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :books, dependent: :destroy
  has_many :book_sellers, dependent: :destroy
  has_many :books, through: :book_sellers, dependent: :destroy
  has_many :addresses, dependent: :destroy
  has_many :feedbacks, dependent: :destroy
  enum role: { customer: 0, seller: 1, author: 2 }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  validates :phone_number, presence: true, numericality: { only_integer: true }, length: { is: 10 }

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "email", "encrypted_password", "id", "name", "phone_number", "remember_created_at", "reset_password_sent_at", "reset_password_token", "role", "updated_at"]
  end
end
