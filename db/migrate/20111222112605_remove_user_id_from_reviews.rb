class RemoveUserIdFromReviews < ActiveRecord::Migration
  def self.up
    remove_column :reviews, :user_id
  end

  def self.down
    add_column :reviews, :user_id, :integer
  end
end
