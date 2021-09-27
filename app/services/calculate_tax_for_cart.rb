# uses the taxjar gem to calculate the tax based on the shipping address, in relation to the users order.

class CalculateTaxForCart

  def initialize(taxable_object:)
    @taxable_object = taxable_object
  end

  def call
    TAXJAR_API.tax_for_order({
      from_country: 'US',
      from_zip: '11791',
      from_state: 'NY',
      from_city: 'syosset',
      from_street: '30 donna ln',
      to_country: 'US',
      to_zip: shipping_address.zip_code,
      to_state: shipping_address.state,
      to_city: shipping_address.city,
      to_street: shipping_address.street_address,
      amount: @taxable_object.subtotal,
      shipping: 0
    })
  end

  private

  def shipping_address
    @_shipping_address ||= @taxable_object.shipping_address
  end

end
