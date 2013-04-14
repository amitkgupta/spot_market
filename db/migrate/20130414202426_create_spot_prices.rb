class CreateSpotPrices < ActiveRecord::Migration
  def change
    create_table :spot_prices do |t|
      t.string :instance_type
      t.string :product_description
      t.decimal :spot_price
      t.timestamp :timestamp
      t.string :availability_zone

      t.timestamps
    end
  end
end
