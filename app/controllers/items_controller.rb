class ItemsController < ApplicationController
  
    before_action :authenticate_user!, only: [:new, :create]
  
  def index
    @items = Item.all
  end

  def new
      @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    redirect_to(store_path)
  end

  def show
    @item = Item.find(params[:id])
    @order = Order.new
    @line_item = LineItem.new
  end

  private

  def item_params
    params.require(:item).permit(:catagory, :condition, :price, :description, :image_url)
  end

end
