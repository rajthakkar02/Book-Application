class AddAddressTypeToAddress < ActiveRecord::Migration[7.2]
  def change
    add_column :addresses, :address_type, :integer, default: 0
  end
end
