class AddProductImageToProducts < ActiveRecord::Migration
  def self.up
    add_column :products, :productimage, :string
  end

  def self.down
    remove_column :products, :productimage
  end
end
