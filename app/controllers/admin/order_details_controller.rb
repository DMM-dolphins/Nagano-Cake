class Admin::OrderDetailsController < ApplicationController

  def update
    @order_detail = OrderDetail.find(params[:id])
    @order = @order_detail.order
    if @order_detail.update(order_detail_params)
      if @order_detail.making_status == "manufacturing"
        @order_detail.order.update(status: "making" )
      elsif @order_detail.order.order_details.count == @order_detail.order.order_details.where(making_status: "finish_manufacture" ).count
        @order_detail.order.update(status: "preparing_ship")
      end
      render admin_order_path(@order)
    end
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end

end
