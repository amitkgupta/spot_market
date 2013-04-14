class SpotPrice < ActiveRecord::Base
  attr_accessible :availability_zone, :instance_type, :product_description, :spot_price, :timestamp

  validates_uniqueness_of :availability_zone, scope: [:instance_type, :product_description, :timestamp]
end
