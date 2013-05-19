namespace :spot_price do
  desc "Fetch and save recent spot price records from AWS"
  task fetch_recent: :environment do
	aws_client = AWS::EC2::Client.new
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

    instance_types.each do |instance_type|
      product_descriptions.each do |product_description|
		SpotPrice.create(
    	  aws_client.describe_spot_price_history({
			instance_types: [instance_type],
			product_descriptions: [product_description]
		  })[:spot_price_history_set]
		)
	  end
	end
  end
end