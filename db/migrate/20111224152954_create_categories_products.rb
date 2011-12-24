class CreateCategoriesProducts < ActiveRecord::Migration
  def self.up
    create_table :categories_products do |t|
      t.integer :product_id
      t.integer :category_id

      t.timestamps
    end
  end

  def self.down
    drop_table :categories_products
  end
end
