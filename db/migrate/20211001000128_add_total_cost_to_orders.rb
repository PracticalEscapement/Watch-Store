class AddTotalCostToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column(:orders, :total_cost, :integer, default: nil)
  end
end
