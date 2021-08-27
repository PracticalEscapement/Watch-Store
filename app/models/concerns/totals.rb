module Totals
  
  extend ActiveSupport::Concern

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
