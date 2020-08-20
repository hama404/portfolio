class ParlorsController < ApplicationController
  def index
    if params[:q]
      @parlors = Parlor.where
    else
      @parlors = Parlor.all
    end
  end

  def show
    @parlor  = Parlor.find(params[:id])
  end

  private

  # Only allow a trusted parameter "white list" through.
  def micropost_params
    params.require(:parlor).permit(:photo, :q)
  end
end
