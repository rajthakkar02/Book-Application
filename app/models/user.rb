class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :books
  enum role: { customer: 0, seller: 1, author: 2 }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
