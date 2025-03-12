class AddressesController < ApplicationController
  def index
    @addresses = Address.all
  end

  def new
    @addresses = Address.new
  end

  def create
    @addresses = Address.new(address_params)
    if @addresses.save
      flash[:notice] = "Address created successfully"
      redirect_to addresses_path
    else
      render :new
    end
  end

  def edit
    @addresses = Address.find(params[:id])
  end

  def update
    @addresses = Address.find(params[:id])
    if @addresses.update(address_params)
      flash[:notice] = "Address updated successfully"
      redirect_to addresses_path
    else
      render :edit
    end
  end

  def destroy
    @addresses = Address.find(params[:id])
    @addresses.destroy
    flash[:notice] = "Address deleted successfully"
    redirect_to addresses_path
  end

  private

  def address_params
    params.require(:address).permit(:address_line1, :address_line2, :city, :state, :country, :pincode, :address_type, :user_id)
  end
end
