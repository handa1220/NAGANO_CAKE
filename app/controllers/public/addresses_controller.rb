class Public::AddressesController < ApplicationController

  def index
    @address = Address.new
    @addresses = Address.where(customer_id: current_customer.id)
  end

  def edit
  end

  def create
    address = Address.new(address_params)
    address.save
    redirect_to addresses_path
  end

  def update
  end

  def destroy
  end

  protected

  def address_params
    params.require(:address).permit(:name, :postal_code, :address)
  end

end
