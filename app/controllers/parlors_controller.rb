class ParlorsController < ApplicationController
  def index
    
    gon.labels = []
    gon.data = []

    if params[:q]
      @parlors = Parlor.where
    else
      @parlors = Parlor.all
    end
  end

  def show
  end

  private

  # Only allow a trusted parameter "white list" through.
  def micropost_params
    params.require(:parlor).permit(:photo, :q)
  end
end
