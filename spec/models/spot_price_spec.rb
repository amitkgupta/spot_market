require 'spec_helper'

describe SpotPrice do
  it "validates joint uniqueness of instance type, product description, timestamp, and availability zone" do
    timestamp = DateTime.now
    SpotPrice.create({
      instance_type: "it",
      product_description: "pd",
      timestamp: timestamp,
      availability_zone: "az",
      spot_price: 1
    })

    SpotPrice.count.should == 1

    SpotPrice.create({
      instance_type: "it",
      product_description: "pd",
      timestamp: timestamp,
      availability_zone: "az",
      spot_price: 2
    })

    SpotPrice.count.should == 1
    SpotPrice.last.spot_price.should == 1

    SpotPrice.create({
      instance_type: "DIFFERENT-it",
      product_description: "pd",
      timestamp: timestamp,
      availability_zone: "az",
      spot_price: 1
    })

    SpotPrice.count.should == 2

    SpotPrice.create({
      instance_type: "it",
      product_description: "pd-DIFFERENT",
      timestamp: timestamp,
      availability_zone: "az",
      spot_price: 2
    })

    SpotPrice.count.should == 3
  end
end
