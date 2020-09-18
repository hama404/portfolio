class AssetsController < ApplicationController
  before_action :authenticate_user!

  def create
    @store = Address.find(params[:id])

    if @store.assets.create(asset_params)
      flash[:success] = "photo was successfully save."
      redirect_to parlor_path(@store.id)
    else
      @title = @store.name
      @parlor_new = Parlor.new
      @parlor = @store.parlor
      @address = @store
      flash.now[:danger] = "Could not save photo"
      render 'parlors/edit'
    end
  end

  def update
  end

  def destroy
  end

  private

  # Only allow a trusted parameter "white list" through.
  def asset_params
    params.require(:asset).permit(
      :photo
    )
  end
end
