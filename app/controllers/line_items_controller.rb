class LineItemsController < ApplicationController
  
  before_action :authenticate_user!

  def index
    shopping_cart = current_user.shopping_cart.items
    @line_items = shopping_cart    
  end

  def create
    shopping_cart = current_user.shopping_cart
    item = Item.find(line_item_params[:item_id])
    if shopping_cart.items.include?(item)
      @line_item = shopping_cart.line_items.find_by(item_id: item.id)
      @line_item.quantity += 1
      @line_item.save!
      redirect_to(root_path, notice: "Item quantity increased")
    else
      @line_item = LineItem.create(line_item_params)
      redirect_to(root_path, notice: "Item has been added!")
    end
  end

  private

  def line_item_params
    params.require(:line_item).permit(:item_id).merge(cart_id: current_user.shopping_cart.id)
  end

end
