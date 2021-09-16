module Totals
  
  extend ActiveSupport::Concern

  def empty?
    line_items.empty?
  end

  def total_quantity
    line_items.sum(&:quantity)
  end

  def subtotal_in_cents
    line_items.sum { |line_item| line_item.item.price * line_item.quantity }
  end

  def subtotal
    subtotal_in_cents / 100
  end

  def sales_tax
    taxes = CalculateTaxForCart.new(taxable_object: self).call
    taxes.amount_to_collect
  end

  def total_in_cents
    tax_in_cents = sales_tax * 100.0
    tax_in_cents_as_int = tax_in_cents.to_int
    subtotal_in_cents + tax_in_cents_as_int
  end

  def total
    total_in_cents / 100.0
  end

end
