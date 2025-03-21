class CreateOrderItems < ActiveRecord::Migration[7.2]
  def change
    create_table :order_items do |t|
      t.references :book_seller, null: false, foreign_key: true
      t.integer :quantity
      t.references :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
