class Public::OrdersController < ApplicationController
  def new
  end

  def thanks
  end

  def index
    @orders = Order.where(customer_id: current_customer.id)
  end

  def show
    @order = Order.find(params[:id])
  end

  def confirm
  end
end
