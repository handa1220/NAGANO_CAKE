class Public::AddressesController < ApplicationController

  protect_from_forgery

  def index
    @address = Address.new
    @addresses = Address.where(customer_id: current_customer.id)
  end

  def edit
  end

  def create
    address = Address.new(address_params)
    address.customer_id = current_customer.id
    address.save!
    redirect_to addresses_path
  end

  def update
  end

  def destroy
  end

  private

  def address_params
    params.require(:address).permit(:customer_id, :name, :postal_code, :address)
  end

end
