class ParlorsController < ApplicationController
  def index
    if params[:q]
      @parlors = Adress.where
    else
      @parlors = Adress.all
    end
  end

  def show
    @parlor = Adress.find(params[:id])
  end

  private

  # Only allow a trusted parameter "white list" through.
end
