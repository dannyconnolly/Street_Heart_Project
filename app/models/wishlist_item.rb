class WishlistItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :wishlist
  validates_uniqueness_of :product_id, :scope => :wishlist_id, :message => "Item already added to wishlist"
end
