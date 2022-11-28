class Public::CartItemsController < ApplicationController

  before_action :authenticate_customer!

  protect_from_forgery

  def index
    @cart_item = CartItem.where(customer_id: current_customer.id)
    @total = 0
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to cart_items_path
  end

  def create
    cart_item = current_customer.cart_items.new(cart_item_params)
    if CartItem.find_by(item_id: params[:cart_item][:item_id])
      cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
      cart_item.amount += params[:cart_item][:amount].to_i
    end
    cart_item.save
    redirect_to cart_items_path
  end

  protected

  def cart_item_params
    params.require(:cart_item).permit(:item_id,:customer_id,:amount)
  end

end
