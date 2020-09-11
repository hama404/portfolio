class ParlorsController < ApplicationController
  before_action :authenticate_user!

  def index
    if !params[:q] && !params[:area]
      @stores = Adress.all
      @title = "parlor list"
    elsif !params[:q]
      @stores = Adress.where(prefecture_code: params[:area][:num])
      @title = "area : #{params[:area][:name]}"
    else
      @stores = Adress.search(params[:q])
      @title = "『#{params[:q]}』"
    end
    @parlor_new = Parlor.new
  end

  def new
  end

  def show
    @parlor = Adress.find(params[:id])
    @title = @parlor.name
    @parlor_new = Parlor.new
  end

  def edit
    @parlor = Adress.find(params[:id])
    @title = @parlor.name
    @parlor_new = Parlor.new
  end

  def create
    @parlor_new = Parlor.new(parlor_params)
    @parlor_new.category_id = 1
    if @parlor_new.save
      adress_new = @parlor_new.adresses.new(parlor_params[:address])
      adress_new.name = parlor_params[:name]
      if adress_new.save
        adress_new.assets.create
        flash[:notice] = "Plese edit parlor detail."
        redirect_to parlor_url(adress_new.id)
      else
        @stores = Adress.all
        @title = "parlor list"
        flash.now[:alert] = "Could not save parlor adress"
        render :index
      end
    else
      @stores = Adress.all
      @title = "parlor list"
      flash.now[:alert] = "Could not save parlor"
      render :index
    end
  end

  def update
    @parlor = Adress.find(params[:id])
    @title = @parlor.name
    @parlor_new = Parlor.new

    if @parlor.update(parlor_params[:address])
      flash[:notice] = "User was successfully updated."
      redirect_to parlor_path(@parlor.id)
    else
      flash.now[:alert] = "Could not updete parlor adress"
      render :edit
    end
  end

  def destroy
    @parlor = Adress.find(params[:id])
    redirect_to root_url if @parlor.nil?

    @parlor.destroy
    flash[:notice] = "parlor deleted"
    redirect_to root_url
  end

  private

  # Only allow a trusted parameter "white list" through.
  def parlor_params
    params.require(:parlor).permit(
      :name, :url, :insta,
      address: [:address1, :address2, :city, :state, :zipcode, :telephone]
    )
  end
end
