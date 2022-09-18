class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
  end

  def show
  end

  def edit
    @item = Item.find(params[:id])
    @genres = Genre.all
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to admin_item_path(@item.id)
    else
      render :edit
    end
  end
end
