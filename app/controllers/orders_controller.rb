class OrdersController < ApplicationController
  
  before_action :authenticate_user!, only: [:create]

  def create
    @order = Order.create(order_params)
  end

private

  def order_params
    params.require(:order).permit(:item_id).merge(user_id: current_user.id)
  end


end
