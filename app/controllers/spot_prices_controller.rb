class SpotPricesController < ApplicationController
  def index
    @spot_prices = SpotPrice.all

    respond_to do |format|
      format.json { render json: @spot_prices }
    end
  end
end
