module AddressValidation
  
  extend ActiveSupport::Concern

  def shipping_and_billing_info_valid
    if addresses.select { |address| address.address_type == 'shipping' }.count > 1
      errors.add(:addresses, 'Cannot have multiple shipping addresses')
    elsif addresses.select { |address| address.address_type == 'billing' }.count > 1
      errors.add(:addresses, 'Cannot have multiple billing addresses')
    end
  end

end