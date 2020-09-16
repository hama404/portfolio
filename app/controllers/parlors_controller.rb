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
    @parlor = Parlor.create(name: "default",
                           category_id: 1)
    @address = @parlor.addresses.create(name: "default")
    @address.assets.create
  end

  def show
    @store = Address.find(params[:id])
    @title = @store.name
    @parlor_new = Parlor.new
  end

  def edit
    @store = Address.find(params[:id])
    @title = @store.name
    @parlor_new = Parlor.new

    @parlor = @store.parlor
    @address = @store
  end

  def create
    parlor_new = Parlor.new(parlor_params)
    parlor_new.category_id = 1
    if parlor_new.save
      address_new = parlor_new.addresses.create(name: parlor_params[:name])
      address_new.assets.create
      flash[:notice] = "Plese edit parlor detail."
      redirect_to parlor_url(address_new.id)
    else
      flash[:danger] = "Could not save parlor"
      redirect_to request.referrer || root_url
    end
  end

  def update
    @store = Address.find(params[:id])

    if @store.parlor.update(parlor_params)
      flash[:success] = "parlor was successfully updated."
      redirect_to parlor_path(@store.id)
    else
      @title = @store.name
      @parlor_new = Parlor.new
      @parlor = @store.parlor
      @address = @store
      flash.now[:danger] = "Could not updete parlor"
      render :edit
    end
  end

  def destroy
  end

  private

  # Only allow a trusted parameter "white list" through.
    def parlor_params
      params.require(:parlor).permit(
        :name, :url, :insta)
    end
end
