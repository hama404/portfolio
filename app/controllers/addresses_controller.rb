class AddressesController < ApplicationController
  before_action :authenticate_user!

  def create
  end

  def update
    @store = Address.find(params[:id])

    if @store.update(address_params)
      flash[:success] = "address was successfully updated."
      redirect_to parlor_path(@store.id)
    else
      @title = @store.name
      @parlor_new = Parlor.new
      @parlor = @store.parlor
      @address = @store
      flash.now[:danger] = "Could not updete address"
      render 'parlors/edit'
    end
  end

  def destroy
    @store = Address.find(params[:id])
    redirect_to root_url if @store.nil?

    @store.destroy
    flash[:success] = "store deleted"
    redirect_to root_url
  end

  private

  # Only allow a trusted parameter "white list" through.
    def address_params
      params.require(:address).permit(
        :name, :address1, :address2, :city, :state, :zipcode, :telephone)
    end
end
