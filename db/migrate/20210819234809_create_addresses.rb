class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.string :first_name
      t.string :last_name
      t.string :street_address
      t.string :street_address_unit
      t.string :city
      t.string :state
      t.string :country
      t.string :zip_code
      t.string :phone_number
      t.string :address_type
      t.references :addressable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
