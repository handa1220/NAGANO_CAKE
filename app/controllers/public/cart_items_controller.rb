class Public::CartItemsController < ApplicationController
  def index
  end

  def update
  end

  def destroy
  end

  def destroy_all
  end

  def create
    cart_item = CartItem.new(cart_item_params)
    item = Item.find(params[:id])
    cart_item.item_id = item.id
    cart_item.customer_id = current_customer.id
    cart_item.save
    redirect_to cart_items_path
  end

  protected

  def cart_item_params
    params.require(:cart_item).permit(:item_id,:customer_id,:amount)
  end

end
