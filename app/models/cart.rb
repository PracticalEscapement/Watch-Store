class Cart < ApplicationRecord
  include AddressValidation
  include Totals

  belongs_to :user
  has_many :line_items, as: :owner
  has_many :items, through: :line_items
  has_many :addresses, as: :addressable

  validate :shipping_and_billing_info_valid

  def clear
    line_items.destroy_all
  end

end