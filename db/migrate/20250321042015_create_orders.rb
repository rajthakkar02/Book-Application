class CreateOrders < ActiveRecord::Migration[7.2]
  def change
    create_table :orders do |t|
      t.integer :current_user
      t.references :address, null: false, foreign_key: true
      t.integer :total_price
      t.integer :order_status, default: 0

      t.timestamps
    end
  end
end
