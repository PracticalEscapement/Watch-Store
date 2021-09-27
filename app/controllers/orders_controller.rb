class OrdersController < ApplicationController

  before_action :authenticate_user!, only: [:create]

  def shipping_info
    @address = Address.new
  end

  def add_shipping_info
    shipping_address = shopping_cart.shipping_address

    if shipping_address.present?
      shipping_address.update!(shipping_address_params)
    else
      shopping_cart.addresses.build(shipping_address_params)
      shopping_cart.save!
    end
    if shopping_cart.shipping_address.address_types_not_equal
      redirect_to(billing_info_path)
    else
      redirect_to(order_summary_path)
    end
  end

  def billing_info
    @address = Address.new
  end

  def add_billing_info
    billing_address = shopping_cart.billing_address
    if billing_address.present?
      billing_address.update!(billing_address_params)
    else
      shopping_cart.addresses.build(billing_address_params)
      shopping_cart.save!
    end
    redirect_to(order_summary_path)
  end

  def order_summary
    @shipping_address = shopping_cart.shipping_address
    @billing_address = shopping_cart.billing_address
    @line_items = shopping_cart.line_items
    @shopping_cart = shopping_cart
    @tax = @shopping_cart.sales_tax
    @order = Order.new
  end

  def create
    @order = Order.create(user: current_user, line_items: shopping_cart.line_items, addresses: shopping_cart.addresses)
    ProcessOrderService.new(order: @order).call
    redirect_to(order_confirmation_path)
  end

  def order_confirmation
    # renders views/orders/order_confirmation
  end

  private

  def shopping_cart
    @_shopping_cart ||= current_user.shopping_cart
  end

  def address_params
    params.require(:address).permit(
      :first_name, :last_name, :street_address, :street_address_unit, :city, :state, :country, :zip_code, :phone_number, :address_types_not_equal
    )
  end

  def shipping_address_params
    address_params.merge(address_type: 'shipping')
  end

  def billing_address_params
    address_params.merge(address_type: 'billing')
  end
end
