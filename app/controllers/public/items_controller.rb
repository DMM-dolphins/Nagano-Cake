class Public::ItemsController < ApplicationController
  def index
    @genres = Genre.all
    @total_items = Item.count
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @genres = Genre.all
    @cart_item = CartItem.new
  end
  
end
