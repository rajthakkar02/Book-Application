class Book < ApplicationRecord
  belongs_to :user
  has_many :book_sellers, dependent: :destroy
  has_many :users, through: :book_sellers, dependent: :destroy
  has_one_attached :book_image, dependent: :destroy
  has_many :feedbacks, dependent: :destroy
  validates :book_name, presence: true, length: { in: 1..50 }
  validates :book_image, presence: true
  validates :MRP, presence: true, numericality: { greater_than: 0 }
  validates :pages, presence: true, numericality: { greater_than: 0 }
  validates :publisher_name, presence: true, length: { in: 1..50 }
  validates :publication_date, presence: true
  validates :language, presence: true, length: { in: 1..50 }
  validates :description, presence: true, length: { minimum: 10 }

  def self.ransackable_associations(auth_object = nil)
    ["book_image_attachment", "book_image_blob", "book_sellers", "user", "users"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["MRP", "book_name", "created_at", "description", "id", "language", "pages", "publication_date", "publisher_name", "updated_at", "user_id"]
  end
end
