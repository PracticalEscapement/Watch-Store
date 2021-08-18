class LineItemsController < ApplicationController
  
  before_action :authenticate_user!

  def index
    @line_items = current_user.shopping_cart.line_items
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

  def update
    line_item = current_user.shopping_cart.line_items.find(params[:line_item][:line_item_id])
    line_item.update!(quantity: params[:line_item][:quantity])
    redirect_to(my_cart_path, notice: "Quantity Changed")
  end

  def destroy
    @line_items = current_user.shopping_cart.items
    @line_items.destroy_all
    redirect_to(my_cart_path, notice: "Cart Has Been Cleared")
  end

  private

  def line_item_params
    params.require(:line_item).permit(:item_id).merge(owner: current_user.shopping_cart)
  end

  def line_item_quantity
    
  end

end
