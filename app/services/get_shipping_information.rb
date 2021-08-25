module GetShippingInformation

  def initialize(addressable)
    @addressable = addressable
  end
    
  def self.shipping_info?
    if order.addresses == nil
      get_info
    else

    end
  end

  def self.shipping_info

  end

end