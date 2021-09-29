class Order < ApplicationRecord
  include AddressValidation
  include Totals

  belongs_to :user
  has_many :line_items, as: :owner
  has_many :addresses, as: :addressable
  has_one :account, as: :accountable

  validate :shipping_and_billing_info_valid

end
