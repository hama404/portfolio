class ParlorsController < ApplicationController
  before_action :authenticate_user!

  def index
    if !params[:q] && !params[:area]
      @stores = Address.all
      @title = "parlor list"
    elsif !params[:q]
      @stores = Address.where(prefecture_code: params[:area][:num])
      @title = "area : #{params[:area][:name]}"
    else
      @stores = Address.search(params[:q])
      @title = "『#{params[:q]}』"
    end
    @parlor_new = Parlor.new
  end

  def new
  end

  def show
    @parlor = Address.find(params[:id])
    @title = @parlor.name
    @parlor_new = Parlor.new
  end

  def edit
    @parlor = Address.find(params[:id])
    @title = @parlor.name
    @parlor_new = Parlor.new
  end

  def create
    @parlor_new = Parlor.new(parlor_params)
    @parlor_new.category_id = 1
    if @parlor_new.save
      address_new = @parlor_new.addresses.new(parlor_params[:address])
      address_new.name = parlor_params[:name]
      if address_new.save
        address_new.assets.create
        flash[:success] = "Plese edit parlor detail."
        redirect_to parlor_url(address_new.id)
      else
        @stores = Address.all
        @title = "parlor list"
        flash.now[:danger] = "Could not save parlor address"
        render :index
      end
    else
      @stores = Address.all
      @title = "parlor list"
      flash.now[:danger] = "Could not save parlor"
      render :index
    end
  end

  def update
    @parlor = Address.find(params[:id])
    @title = @parlor.name
    @parlor_new = Parlor.new

    parlor_params[:address].merge(prefecture_code: 13)
    if @parlor.update(parlor_params[:address])
      flash[:success] = "User was successfully updated."
      redirect_to parlor_path(@parlor.id)
    else
      flash.now[:danger] = "Could not updete parlor address"
      render :edit
    end
  end

  def destroy
    @parlor = Address.find(params[:id])
    redirect_to root_url if @parlor.nil?

    @parlor.destroy
    flash[:success] = "parlor deleted"
    redirect_to root_url
  end

  private

  # Only allow a trusted parameter "white list" through.
    def parlor_params
      params.require(:parlor).permit(
        :name, :url, :insta,
        address: [:address1, :address2, :city, :state, :zipcode, :telephone])
    end
end
