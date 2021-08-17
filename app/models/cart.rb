class Cart < ApplicationRecord
  belongs_to :user
  has_many :line_items
  has_many :items, through: :line_items

  def clear
    line_items.destroy_all
  end

  def total_quantity
    line_items.sum {|line_item| line_item.quantity}
  end

  def total_cost
    line_items.sum {|line_item| line_item.item.price * line_item.quantity}
  end


end


