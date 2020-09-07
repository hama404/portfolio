class ParlorsController < ApplicationController
  before_action :authenticate_user!

  def index
    if !params[:q]
      @parlors = Adress.all
      @title = "parlor list"
    else
      @parlors = Adress.search(params[:q])
      @title = "『#{params[:q]}』"
    end
  end

  def show
    @parlor = Adress.find(params[:id])
    @title = @parlor.name
  end

  private

  # Only allow a trusted parameter "white list" through.
  def search_params
    params.require(:q).permit(:name)
  end
end
