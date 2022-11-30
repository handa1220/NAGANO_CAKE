class Admin::OrderDetailsController < ApplicationController

  before_action :authenticate_admin!

  def update
    order_detail = OrderDetail.find(params[:id])
    order_detail.update(order_detail_params)
    order_details = OrderDetail.where(order_id: order_detail.order_id).pluck('production_status')
    if order_detail.production_status == "under_manufacture"
      order = Order.find(order_detail.order_id)
      order.update(order_status: 2)
    elsif order_details.all? { |w| w == "manufacturing_completed" }
      order = Order.find(order_detail.order_id)
      order.update(order_status: 3)
    end
    redirect_to admin_order_path(order_detail.order_id)
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:production_status)
  end

end
