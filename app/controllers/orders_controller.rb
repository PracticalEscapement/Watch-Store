class OrdersController < ApplicationController
  
  before_action :authenticate_user!, only: [:create]

  def create
    @cart = current_user.shopping_cart
    @order = Order.create(user: current_user, line_items: @cart.line_items)
    ProcessOrderService.new(order: @order).call
    redirect_to(order_confirmation_path)
  end

end
