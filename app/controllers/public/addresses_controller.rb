class Public::AddressesController < ApplicationController

  protect_from_forgery

  def index
    @address = Address.new
    @addresses = Address.where(customer_id: current_customer.id)
  end

  def edit
    @address = Address.find(params[:id])
  end

  def create
    address = current_customer.addresses.new(address_params)
    address.save!
    redirect_to addresses_path
  end

  def update
    @address = Address.find(params[:id])
    @address.update(address_params)
    redirect_to addresses_path
  end

  def destroy
    @address = Address.find(params[:id])
    @address.delete
    redirect_to addresses_path
  end

  private

  def address_params
    params.require(:address).permit(:customer_id, :name, :postal_code, :address)
  end

end
