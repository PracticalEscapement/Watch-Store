class Cart < ApplicationRecord
  belongs_to :user
  has_many :line_items, as: :owner
  has_many :items, through: :line_items

  def clear
    line_items.destroy_all
  end

  def empty?
    line_items.empty?
  end

  def total_quantity
    line_items.sum(&:quantity)
  end

  def total_cost
    total_cost_in_cents / 100
  end

  def total_cost_in_cents
    line_items.sum { |line_item| line_item.item.price * line_item.quantity }
  end

end