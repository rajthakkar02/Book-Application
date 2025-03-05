class CreateBookSellers < ActiveRecord::Migration[7.2]
  def change
    create_table :book_sellers do |t|
      t.references :book, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :quantity
      t.integer :seller_price

      t.timestamps
    end
  end
end
