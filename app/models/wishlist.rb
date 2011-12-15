class Wishlist < ActiveRecord::Base
  belongs_to :user
  has_many :wishlist_items, :dependent => :destroy
end
