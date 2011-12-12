class Removal < ActiveRecord::Migration
  def self.up
    drop_table :reviews
    drop_table :wishlists
    remove_column :users, :userpic
  end

  def self.down
  end
end
