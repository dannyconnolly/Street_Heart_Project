class AddPurchasedAtToCart < ActiveRecord::Migration
  def self.up
    add_column :carts, :purchased_at, :datetime
  end

  def self.down
    remove_column :carts, :purchased_at
  end
end
