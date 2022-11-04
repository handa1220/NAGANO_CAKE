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
    
    redirect_to cart_items_path
  end

  protected

  def cart_item_params
    params.require(:cart_item).permit(:item_id,:customer_id,:amount)
  end

end
