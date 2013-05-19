class SpotPricesController < ApplicationController
  def index
  	instance_types = [
      "m1.small",
      "m1.medium",
      "m1.large",
      "m1.xlarge",
      "m3.xlarge",
      "m3.2xlarge",
      "c1.medium",
      "c1.xlarge",
      "cc2.8xlarge",
	  "m2.xlarge",
      "m2.2xlarge",
      "m2.4xlarge",
      "cr1.8xlarge",
      "hi1.4xlarge",
      "hs1.8xlarge",
      "t1.micro",
      "cg1.4xlarge"
    ]
    product_descriptions = [
      "Linux/UNIX (Amazon VPC)",
      "Linux/UNIX"
    ]

    @spot_prices = Hash.new

    instance_types.each do |instance_type|
      product_descriptions.each do |product_description|
    	instance_spot_prices = SpotPrice.where(instance_type: instance_type, product_description: product_description).group_by(&:availability_zone)
    	instance_spot_prices.each do |az, spot_price_data|
    	  instance_spot_prices[az] = spot_price_data.map { |sp| [1000*sp.timestamp.to_i, sp.spot_price.to_f] }.sort_by { |x| x[0] }
    	end
    	@spot_prices[[instance_type, product_description]] = instance_spot_prices
      end
    end
  end
end