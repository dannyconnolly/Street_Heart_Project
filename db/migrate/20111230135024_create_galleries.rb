class CreateGalleries < ActiveRecord::Migration
  def self.up
    create_table :galleries do |t|
      t.integer :user_id
      t.string :image

      t.timestamps
    end
  end

  def self.down
    drop_table :galleries
  end
end