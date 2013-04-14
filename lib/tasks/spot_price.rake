namespace :spot_price do
  desc "Fetch and save recent spot price records from AWS"
  task fetch_recent: :environment do
    SpotPrice.create AWS::EC2::Client.new.describe_spot_price_history[:spot_price_history_set]
  end
end
