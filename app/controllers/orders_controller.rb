class OrdersController < ApplicationController

  before_action :authenticate_user!, only: [:create]

  def shipping_info
    @address = Address.new
  end

  def add_shipping_info
    shopping_cart = current_user.shopping_cart
    shipping_address = shopping_cart.addresses.where(address_type: 'shipping').last
    if shipping_address.present?
      shipping_address.update!(address_params)
    else
      shopping_cart.addresses.build(address_params)
      shopping_cart.save!
    end
    redirect_to(order_summary_path)
  end

  def order_summary
    @address = current_user.shopping_cart.addresses.last
    @line_items = current_user.shopping_cart.line_items
    @shopping_cart = current_user.shopping_cart
    @order = Order.new
  end

  def create
    @shopping_cart = current_user.shopping_cart
    @order = Order.create(user: current_user, line_items: @shopping_cart.line_items, addresses: @shopping_cart.addresses)
    ProcessOrderService.new(order: @order).call
    redirect_to(order_confirmation_path)
  end

  def order_confirmation
    # renders views/orders/order_confirmation
  end

  private

  def address_params
    params.require(:address).permit(
      :first_name, :last_name, :street_address, :street_address_unit, :city, :state, :country, :zip_code, :phone_number
    ).merge(address_type: 'shipping')
  end
end
