class SpotPrice < ActiveRecord::Base
  attr_accessible :availability_zone, :instance_type, :product_description, :spot_price, :timestamp
end
