class Wishlist < ActiveRecord::Base
  has_many :wishlist_items, :dependent => :destroy
end
