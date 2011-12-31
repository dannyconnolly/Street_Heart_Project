class AddUserIdToReviews < ActiveRecord::Migration
  def self.up
    add_column :reviews, :user_id, :integer
    remove_column :reviews, :name
  end

  def self.down
    add_column :reviews, :name, :string
    remove_column :reviews, :user_id
  end
end
