class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def confirm
    @cart_item = CartItem.where(customer_id: current_customer.id)
    @total = 0
    @postage = 800
    @order = Order.new(order_params)
    if params[:order][:select_address] == 0
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.first_name + current_customer.last_name
    else if params[:order][:select_address] == 2
      @address = Address.find(params[:order][:address_id])
    end
  end

  def thanks
  end

  def create
  end

  def index
  end

  def show
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name)
  end

end