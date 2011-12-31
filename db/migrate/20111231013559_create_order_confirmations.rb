class CreateOrderConfirmations < ActiveRecord::Migration
  def self.up
    create_table :order_confirmations do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :order_confirmations
  end
end
