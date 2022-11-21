class Public::CartItemsController < ApplicationController

  protect_from_forgery

  def index
    @cart_item = CartItem.where(customer_id: current_customer.id)
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy
  end

  def destroy_all
  end

  def create
    cart_item = current_customer.cart_items.new(cart_item_params)
    cart_item.save!
    redirect_to cart_items_path
  end

  protected

  def cart_item_params
    params.require(:cart_item).permit(:item_id,:customer_id,:amount)
  end

end
