class RemoveItemIdColumnFromOrdersTable < ActiveRecord::Migration[6.1]
  def change
    remove_column :orders, :item_id 
  end
end
