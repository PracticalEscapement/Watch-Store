class AddOwnerToLineItems < ActiveRecord::Migration[6.1]
  def change
    remove_column :line_items, :cart_id
    add_column :line_items, :owner_type, :string
    add_column :line_items, :owner_id, :integer
  end
end
