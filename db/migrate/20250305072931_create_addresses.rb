class CreateAddresses < ActiveRecord::Migration[7.2]
  def change
    create_table :addresses do |t|
      t.text :address_line1
      t.text :address_line2
      t.string :landmark
      t.integer :pincode
      t.string :city
      t.string :state

      t.timestamps
    end
  end
end
