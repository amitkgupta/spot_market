namespace :spot_price do
  desc "Fetch and save recent spot price records from AWS"
  task fetch_recent: :environment do
	aws_client = AWS::EC2::Client.new
	aws_hi_mem_vpc_spot_prices = aws_client.describe_spot_price_history({
		instance_types: ["cr1.8xlarge"], 
		product_descriptions: ["Linux/UNIX (Amazon VPC)"]
	})
    SpotPrice.create aws_hi_mem_vpc_spot_prices[:spot_price_history_set]
  end
end
