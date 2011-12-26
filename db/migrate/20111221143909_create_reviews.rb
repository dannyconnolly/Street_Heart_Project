class CreateReviews < ActiveRecord::Migration
  def self.up
    create_table :reviews do |t|
      t.integer :user_id
      t.integer :product_id
      t.text :body
      drop_table :list_items

      t.timestamps
    end
  end

  def self.down
    drop_table :reviews
  end
end
