class AccountsController < ApplicationController

  before_action :authenticate_user!

  def account_home
  end
  
  def order_history
    @orders = current_user.orders
  end

  def previous_order
    @order = Order.find(params[:id])
    @line_items = @order.line_items
  end

end

