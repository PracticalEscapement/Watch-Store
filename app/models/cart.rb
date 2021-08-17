class Cart < ApplicationRecord
  belongs_to :user
  has_many :line_items
  has_many :items, through: :line_items

  def clear
    line_items.destroy_all
  end

  def total_quantity
    total_count = 0
    line_items.each do |line_item|
      total_count += line_item.quantity
    end
    total_count
  end

end

