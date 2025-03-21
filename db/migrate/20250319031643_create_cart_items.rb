class CreateCartItems < ActiveRecord::Migration[7.2]
  def change
    create_table :cart_items do |t|
      t.references :cart, null: false, foreign_key: true
      t.references :book_seller, null: false, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
