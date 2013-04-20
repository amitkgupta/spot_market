class SpotPricesController < ApplicationController
  def index
    @spot_prices = SpotPrice.where(instance_type: "cr1.8xlarge", product_description: "Linux/UNIX (Amazon VPC)").group_by(&:availability_zone)
    @spot_prices.each do |az, spot_price_data|
    	@spot_prices[az] = spot_price_data.map { |sp| [1000*sp.timestamp.to_i, sp.spot_price.to_f] }.sort_by { |x| x[0] } 
    end
  end
end
