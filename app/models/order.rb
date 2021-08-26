class Order < ApplicationRecord
  include AddressValidation

  belongs_to :user
  has_many :line_items, as: :owner
  has_many :addresses, as: :addressable

  validate :shipping_and_billing_info_valid


end
