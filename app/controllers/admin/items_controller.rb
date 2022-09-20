class Admin::ItemsController < ApplicationController
    before_action :authenticate_admin!
  def index
    @items = Item.page(params[:page]).per(10)
  end

  def new
    @item = Item.new
    @genres = Genre.all
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:notice] = "商品を登録しました"
      redirect_to admin_items_path
    else
      flash[:notice] = "入力内容を確認してください"
      render:"new"
    end
  end


  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    @genres = Genre.all
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      flash[:notice] = "商品登録情報を変更しました"
      redirect_to admin_item_path(@item.id)
    else
      flash[:notice] = "入力内容を確認してください"
      @genres = Genre.all
      @item = Item.new
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :genre_id, :introduction, :price, :is_active, :item_image)
  end
end
