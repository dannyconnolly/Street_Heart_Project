class CreateWishlists < ActiveRecord::Migration
  def self.up
    create_table :wishlists do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :wishlists
  end
end
