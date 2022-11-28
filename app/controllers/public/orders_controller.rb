class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def confirm
    @cart_item = CartItem.where(customer_id: current_customer.id)
    @total = 0
    @postage = 800
    @order = Order.new(order_params)
    if params[:order][:select_address] == nil
      redirect_to new_order_path
    elsif params[:order][:select_address] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.first_name + current_customer.last_name
    elsif params[:order][:select_address] == "2"
      @address = Address.find(params[:order][:address_id])
    end
  end

  def thanks
  end

  def create
    order = current_customer.orders.new(order_params)
    order.save

    cart_items = CartItem.where(customer_id: current_customer.id)
    cart_items.each do |cart_item|
      order_detail = OrderDetail.new
      order_detail.order_id = order.id
      order_detail.item_id = cart_item.item_id
      order_detail.price_at_purchase = cart_item.item.with_tax_price
      order_detail.amount = cart_item.amount
      order_detail.save
    end
    current_customer.cart_items.destroy_all
    redirect_to thanks_orders_path
  end

  def index
    @order = Order.where(customer_id: current_customer.id)

  end


  def show
    @order = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: @order.id)
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :payment_method, :postal_code, :address, :name, :total_price, :postage)
  end

end