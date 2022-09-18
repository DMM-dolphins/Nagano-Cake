class Public::ItemsController < ApplicationController
  def index
    @genres = Genre.all
    @total_items = Item.count
    @items = Item.all
  end

  def show
  end
end
