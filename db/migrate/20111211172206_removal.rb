class Removal < ActiveRecord::Migration
  def self.up
    remove_column :users, :userpic
  end

  def self.down
  end
end
