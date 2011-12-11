class Removal < ActiveRecord::Migration
  def self.up
    drop_table :reviews
    drop_table :wishlists
    remove_column :users, :userpic
    remove_column :users, :avatar
  end

  def self.down
  end
end
