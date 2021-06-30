class OrdersController < ApplicationController
  
  before_action :authenticate_user!, only: [:create]

  def create
    @order = Order.create(order_params)
    ProcessOrderService.new(order: @order).call
    redirect_to(order_confirmation_path)
  end

private

  def order_params
    params.require(:order).permit(:item_id).merge(user_id: current_user.id)
  end


end
