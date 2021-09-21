class AddAddressTypesNotEqualToAddresses < ActiveRecord::Migration[6.1]
  def change
    add_column :addresses, :address_types_not_equal, :boolean, default: false
  end
end
