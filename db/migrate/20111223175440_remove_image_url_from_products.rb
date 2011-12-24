class RemoveImageUrlFromProducts < ActiveRecord::Migration
  def self.up
    remove_column :products, :image_url
  end

  def self.down
    add_column :products, :image_url, :string
  end
end
