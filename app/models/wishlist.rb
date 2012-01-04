#
 #  Classname wishlist.rb
 #
 #  Version information e.g. Rev 1
 #
 #
 #  @author Danny Connolly, x11105810
 #
 #
class Wishlist < ActiveRecord::Base
  belongs_to :user
  has_many :wishlist_items, :dependent => :destroy
end
